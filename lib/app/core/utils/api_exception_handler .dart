import 'dart:io';

import 'package:dio/dio.dart';

class ApiExceptionHandler {
  static String getErrorMessage(dynamic error) {
    String messageError = "";
    if (error is DioException) {
      print("👮‍♂️👮‍♂️👮‍♂️ + ${error.message}");
      print("👮‍♂️👮‍♂️👮‍♂️ + ${error.response!.data.toString()}");
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.sendTimeout) {
        messageError =
            'Timeout error. Please check your internet connection and try again.';
      } else if (error.type == DioExceptionType.badResponse) {
        if (error.response?.statusCode == 401) {
          messageError = 'Unauthorized. Please log in again.';
        } else {
          messageError = 'An error occurred. Please try again later.';
        }
      } else if (error.type == DioExceptionType.cancel) {
        messageError = 'Request cancelled.';
      } else {
        messageError = 'An error occurred. Please try again later.';
      }
    } else if (error is SocketException) {
      print("👮‍♂️👮‍♂️👮‍♂️ + ${error.toString()}");
      messageError =
          'Timeout error. Please check your internet connection and try again.';
    } else if (error is Exception) {
      print("👮‍♂️👮‍♂️👮‍♂️ + ${error.toString()}");
      messageError = error.toString();
    } else {
      print("👮‍♂️👮‍♂️👮‍♂️ + ${error.toString()}");
      messageError = error.toString();
    }
    return messageError;
  }
}
