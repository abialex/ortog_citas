import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/domain/either/either.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../models/contenedor_model.dart';

class ContenedorAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoGenero() async {
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
      final response = await _dio.get('/choices/v1/combos-tipo-genero');
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<ContenedorModel> list =
              listRequest.map((e) => ContenedorModel.fromJson(e)).toList();
          return Either.right(list);
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

  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoDocumento() async {
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
      final response = await _dio.get('/choices/v1/combos-tipo-documento');
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<ContenedorModel> list =
              listRequest.map((e) => ContenedorModel.fromJson(e)).toList();
          return Either.right(list);
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

  Future<Either<SystemNotification, List<ContenedorModel>>>
      getContenedorTipoOcupacion() async {
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
      final response = await _dio.get('/choices/v1/combos-tipo-ocupacion');
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<ContenedorModel> list =
              listRequest.map((e) => ContenedorModel.fromJson(e)).toList();
          return Either.right(list);
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
}
