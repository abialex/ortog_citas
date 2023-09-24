import 'dart:convert';

import 'package:ortog_citas/app/data/models/paciente/paciente_create_from_cita_model.dart';
import 'package:ortog_citas/app/data/models/paciente/paciente_create_model.dart';
import 'package:ortog_citas/app/data/models/paciente/paciente_item_model.dart';
import 'package:ortog_citas/app/data/models/request_models/paciente_request.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/extensions/string_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../../domain/either/either.dart';
import '../../../../ui/routes/app_routes.dart';
import '../../../models/paciente/paciente_model.dart';
import '../../../models/paciente/paciente_update_model.dart';
import '../../../models/response_api_model.dart';
import '../../../models/system_notification.dart';

class PacienteApi {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, PacienteModel?>> getPacienteByDni(
      String dni) async {
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
        "/recurso_humano/paciente-by-dni/${dni}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          PacienteModel paciente = PacienteModel.fromJson(response);
          return Either.right(paciente);
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

  Future<Either<SystemNotification, PacienteModel?>> getPacienteById(
      int id) async {
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
        "/recurso_humano/paciente-by-id/${id}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          PacienteModel paciente = PacienteModel.fromJson(response);
          return Either.right(paciente);
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

  Future<Either<SystemNotification, List<PacienteItemModel>>> getFilterPaciente(
      PacienteRequest pacienteRequest) async {
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
      final response = await _dio.post(
        "/recurso_humano/paciente-list",
        data: jsonEncode(
          pacienteRequest.toJson(),
        ),
      );

      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<PacienteItemModel> list =
              listRequest.map((e) => PacienteItemModel.fromJson(e)).toList();
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

  Future<Either<SystemNotification, int>> createPaciente(
      PacienteCreateModel pacienteCreateModel) async {
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
      final response = await _dio.post("/recurso_humano/paciente-create",
          data: jsonEncode(pacienteCreateModel.toJson()));

      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          final result = response as int;
          return Either.right(result);
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

  Future<Either<SystemNotification, int>> updatePaciente(
      PacienteUpdateModel pacienteCreateModel) async {
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
      final response = await _dio.put("/recurso_humano/paciente-update",
          data: jsonEncode(pacienteCreateModel.toJson()));
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          final result = response as int;
          return Either.right(result);
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

  Future<Either<SystemNotification, int>> createPacienteFromCita(
      PacienteCreateFromCitaModel pacienteCreateModel) async {
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
      final response = await _dio.post(
          "/recurso_humano/paciente-create-from-cita",
          data: pacienteCreateModel.toJson());
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          final result = response as int;
          return Either.right(result);
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
