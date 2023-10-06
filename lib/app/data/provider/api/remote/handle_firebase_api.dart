import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../../domain/either/either.dart';
import '../../../models/notification/notification_model.dart';
import '../../../models/system_notification.dart';
import '../../../models/user_token_firebase_model.dart';

class HandleFirebaseAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, bool>> sendNotification(
      NotificationModel notificationModel) async {
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
      final response = await _dio.post("/notification/message",
          data: notificationModel.toJson());
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          //validación extra

          return Either.left(SystemNotification);
        },
        right: (response) async {
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

  Future<Either<SystemNotification, bool>> saveUserTokenFirebase(
      UserTokenFirebaseModel userTokenFirebaseModel) async {
    _dio.options.validateStatus =
        (status) => true; //permitiendo otros status en ves de solo 200
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(""),
    ]);

    try {
      final response = await _dio.post(
        "/session/token-firebase",
        data: jsonEncode(userTokenFirebaseModel.toJson()),
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          return Either.left(SystemNotification);
        },
        right: (response) async {
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
}
