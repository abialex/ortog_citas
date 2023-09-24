import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../../domain/either/either.dart';
import '../../../models/doctor/doctor_model.dart';
import '../../../models/system_notification.dart';

class DoctorAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, List<DoctorModel>>> getDoctoresById(
      int id) async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);

    try {
      final response = await _dio.get(
        "/recurso_humano/doctor-list-byidsede/${id}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<DoctorModel> doctores =
              listRequest.map((e) => DoctorModel.fromJson(e)).toList();
          return Either.right(doctores);
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

  Future<Either<SystemNotification, List<DoctorModel>>> getDoctoresByIdUsuario(
      int idusuario) async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);

    try {
      final response = await _dio.get(
        "/recurso_humano/doctor-list-byidusuario/${idusuario}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          List<dynamic> listRequest = response;
          List<DoctorModel> doctores =
              listRequest.map((e) => DoctorModel.fromJson(e)).toList();
          return Either.right(doctores);
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

  Future<Either<SystemNotification, DoctorModel?>> getDoctorByIdUsuario(
      int usuarioId) async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);

    try {
      final response = await _dio.get(
        "/recurso_humano/doctor-by-usuarioId/${usuarioId}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
          DoctorModel doctor = DoctorModel.fromJson(response);
          return Either.right(doctor);
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
