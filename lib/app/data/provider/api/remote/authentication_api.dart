import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/extensions/string_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../../domain/either/either.dart';
import '../../../../ui/routes/app_routes.dart';
import '../../../models/response_api_model.dart';
import '../../../models/system_notification.dart';
import '../../../models/usuario/usuario_responsive.dart';
import '../../../repository_imp/local/local_auth_repository.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _storage = Get.find<LocalAuthRepository>();

  AuthenticationAPI() {
    setHeader();
  }

  setHeader() async {
    final UsuarioResponsive? usuarioResponsive = await _storage.currentUser;
    final String sessionKey =
        usuarioResponsive != null ? await usuarioResponsive.sessionKey : "";
    String? csrftoken = await _storage.csrftoken;
    csrftoken = csrftoken != null ? csrftoken : "";
    _dio.options.headers = {
      "X-CSRFToken": "${csrftoken}",
      "Cookie": "csrftoken=${csrftoken}; sessionid=${sessionKey}"
    };
  }

  Future<UsuarioResponsive?> getCurrentUser() async {
    // await setHeader();
    final response = await _dio.get(
      '/session/getUser',
    );
    ResponseApiModel responseApiModel =
        ResponseApiModel.fromJson(response.data);
    if (responseApiModel.status == 200) {
      return UsuarioResponsive.fromJson(responseApiModel.result);
    }
    return null;
  }

  Future<Either<SystemNotification, UsuarioResponsive>> login(
      String username, String password) async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);
    bool hasInternet = await Network.checkInternetConnectivity();
    if (!hasInternet) {
      return Either.left(
        SystemNotification(
          titulo: "Internet",
          mensaje: "No hay conexión",
          detalle: "",
        ),
      );
    }
    final response = await _dio.post(
      '/session/signIn',
      data: {
        "username": username,
        "password": password,
      },
    );
    try {
      ResponseApiModel responseApi = ResponseApiModel.fromJson(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        String csrftoken = response.headers["set-cookie"]![0].substring(10, 42);
        final UsuarioResponsive usuarioReponsive =
            UsuarioResponsive.fromJson(responseApi.result);
        await _storage.setSession(usuarioReponsive);
        await _storage.setCsrftoken(csrftoken);
        await setHeader();
        return Either.right(usuarioReponsive);
      } else if (response.statusCode == 401) {
        return Either.right(UsuarioResponsive(
          id: 0,
          sessionKey: "",
          sedes: [],
          roles: [],
          username: username,
          persona: "",
        ));
      } else if (response.statusCode == 500) {
        String errorMessage =
            StringExtensions.toFormatString(responseApi.invalidParams);
        return Either.left(
          SystemNotification(
            titulo: "Errores en los siguientes campos",
            mensaje: errorMessage,
            detalle: "",
          ),
        );
      } else {
        return Either.left(
          SystemNotification(
            titulo: "Error",
            mensaje:
                "${(responseApi.detail ?? "sin detalle")} ${response.statusCode}",
            detalle: "",
          ),
        );
      }
    } catch (e) {
      final errorMessage = ApiExceptionHandler.getErrorMessage(e);
      return Either.left(
        SystemNotification(
          titulo: "Error System",
          mensaje: errorMessage,
          detalle: "",
        ),
      );
    }
  }

  Future<Either<SystemNotification, bool>> logout() async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);
    bool hasInternet = await Network.checkInternetConnectivity();
    if (!hasInternet) {
      return Either.left(
        SystemNotification(
          titulo: "Internet",
          mensaje: "No hay conexión",
          detalle: "",
        ),
      );
    }
    try {
      final response = await _dio.get('/session/signOut');
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          await _storage.clearSession();
          return Either.right(true);
        },
      );
    } catch (e) {
      final errorMessage = ApiExceptionHandler.getErrorMessage(e);
      return Either.left(
        SystemNotification(
          titulo: "Error System",
          mensaje: errorMessage,
          detalle: "",
        ),
      );
    }
  }

  Future<Either<SystemNotification, bool>> autenthicate() async {
    UsuarioResponsive? userCurrent = await _storage.currentUser;
    if (userCurrent == null) {
      return Either.right(false);
    }
    _dio.options.validateStatus = (status) => true; //
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(userCurrent.sessionKey),
    ]);
    bool hasInternet = await Network.checkInternetConnectivity();
    if (!hasInternet) {
      return Either.left(
        SystemNotification(
          titulo: "Internet",
          mensaje: "No hay conexión",
          detalle: "",
        ),
      );
    }
    try {
      final response = await _dio.get('/session/autenticate');
      ResponseApiModel responseApi = ResponseApiModel.fromJson(response.data);
      if (response.statusCode == 200) {
        final response = responseApi.success;
        return Either.right(response);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(AppRoutes.LOGIN);
        return Either.left(
          SystemNotification(
            titulo: "Lo sentimos",
            mensaje: "Tu sesión ha expirado.",
            detalle: "",
          ),
        );
      } else if (response.statusCode == 404) {
        Get.offAllNamed(AppRoutes.LOGIN);
        return Either.left(
          SystemNotification(
            titulo: "404",
            mensaje: "Tu sesión no se ha encontrado, inicie sesión",
            detalle: "",
          ),
        );
      } else {
        return Either.left(
          SystemNotification(
            titulo: "Error",
            mensaje:
                "${(responseApi.detail ?? "sin detalle")} ${response.statusCode}",
            detalle: "",
          ),
        );
      }
    } catch (e) {
      final errorMessage = ApiExceptionHandler.getErrorMessage(e);
      return Either.left(
        SystemNotification(
          titulo: "Error System",
          mensaje: errorMessage,
          detalle: "",
        ),
      );
    }
  }
}
