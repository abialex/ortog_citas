import 'package:ortog_citas/app/core/utils/extensions/response_extends.dart';
import 'package:ortog_citas/app/data/models/cita/cita_create_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_detalle_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_rapida_item_model.dart';
import 'package:ortog_citas/app/data/models/cita/hora_model.dart';
import 'package:ortog_citas/app/data/models/request_models/cita_request_v2.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/ui/routes/app_routes.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../domain/either/either.dart';
import 'package:ortog_citas/app/data/models/response_api_model.dart';

import '../../../models/request_models/cita_request_v1.dart';

class CitaAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, List<HoraModel>>> getCitaFilterToday(
      CitaRequestv2Model citaRequest) async {
    _dio.interceptors.addAll(
      [
        LoggingInterceptor(),
        AuthInterceptor(""),
      ],
    );
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
      final response = await _dio.post(
        "/cita/cita-list-v2",
        data: citaRequest.toJson(),
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<HoraModel> horas =
              listRequest.map((e) => HoraModel.fromJson(e)).toList();
          return Either.right(horas);
        },
      );
    } catch (e) {
      final errorMessage = ApiExceptionHandler.getErrorMessage(e);
      return Either.left(
        SystemNotification(
          titulo: "Error de Sistema",
          mensaje: errorMessage,
          detalle: "",
        ),
      );
    }
  }

  Future<Either<SystemNotification, int>> createCita(
      CitaCreateModel citaModel) async {
    final Dio _dio = Get.find<Dio>();
    _dio.interceptors.addAll(
      [
        LoggingInterceptor(),
        AuthInterceptor(""),
      ],
    );

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
      final response = await _dio.post(
        "/cita/cita-create",
        data: citaModel.toJson(),
      );

      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          int idCita = response as int;

          return Either.right(idCita);
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

  Future<Either<SystemNotification, bool>> deleteCita(int idcita) async {
    final Dio _dio = Get.find<Dio>();
    _dio.interceptors.addAll(
      [
        LoggingInterceptor(),
        AuthInterceptor(""),
      ],
    );
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
      final response = await _dio.delete(
        "/cita/cita-delete/${idcita}",
      );

      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          bool isDelete = response as bool;
          return Either.right(isDelete);
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

  Future<Either<SystemNotification, CitaDetalleModel>> getCitaById(
      int id) async {
    final Dio _dio = Get.find<Dio>();
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll(
      [
        LoggingInterceptor(),
        AuthInterceptor(""),
      ],
    );

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
      final response = await _dio.get(
        "/cita/cita-by-id/${id}",
      );

      ResponseApiModel responseApi = ResponseApiModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return Either.right(CitaDetalleModel.fromJson(responseApi.result));
      } else if (response.statusCode == 401) {
        Get.offAllNamed(AppRoutes.LOGIN);
        return Either.left(
          SystemNotification(
            titulo: "Lo sentimos",
            mensaje: "Tu sesión ha expirado.",
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

  Future<Either<SystemNotification, List<CitaRapidaItemModel>>>
      getCitasRapidasFilter(CitaRequestv1Model citaRequestv2Model) async {
    _dio.interceptors.addAll(
      [
        LoggingInterceptor(),
        AuthInterceptor(""),
      ],
    );
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
      final response = await _dio.post(
        "/cita/cita-list-v1",
        data: citaRequestv2Model.toJson(),
      );

      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<CitaRapidaItemModel> horas =
              listRequest.map((e) => CitaRapidaItemModel.fromJson(e)).toList();
          return Either.right(horas);
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
