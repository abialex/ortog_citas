import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String accessToken;

  AuthInterceptor(this.accessToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['sessionkey'] = accessToken;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (error.response != null) {
      if (error.response!.statusCode == 401) {
        print("error");
      } else if (error.response!.statusCode == 404) {
        // Implementa el manejo de error de recurso no encontrado aquí
      } else {
        // Implementa el manejo de error genérico aquí
      }
    }
    super.onError(error, handler);
  }
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('--> ${options.method} ${options.uri}');
    print('Headers:');
    options.headers.forEach((key, value) => print('$key: $value'));
    if (options.data != null) {
      print('Body:');
      print(options.data);
    }
    print('<-- END ${options.method}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '--> ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');
    print('Headers:');
    response.headers.forEach((key, value) => print('$key: $value'));
    if (response.data != null) {
      print('Body:');
      print(response.data);
    }
    print('<-- END ${response.requestOptions.method}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print(
        '--> ${error.message} ${error.requestOptions.method} ${error.requestOptions.uri}');
    if (error.response != null) {
      print('Headers:');
      error.response!.headers.forEach((key, value) => print('$key: $value'));
      if (error.response!.data != null) {
        print('Body:');
        print(error.response!.data);
      }
      print('<-- END ERROR ${error.requestOptions.method}');
    }
    super.onError(error, handler);
  }
}



// import 'dart:async';
// import 'package:dio/dio.dart';

// class LoggingInterceptor extends Interceptor {
//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // Log the request
//     print(
//         'Sending request to ${options.uri.toString()} with headers ${options.headers} and body ${options.data}');

//     return handler.next(options);
//   }

//   @override
//   Future<void> onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) async {
//     // Log the response
//     print(
//         'Received response with status ${response.statusCode} and headers ${response.headers}');

//     return handler.next(response);
//   }

//   @override
//   Future<void> onError(
//     DioError error,
//     ErrorInterceptorHandler handler,
//   ) async {
//     // Log the error
//     print('Error sending request: ${error.message}');

//     return handler.next(error);
//   }
// }

// class RetryInterceptor extends Interceptor {
//   final int maxRetries;
//   final int retryDelay;

//   RetryInterceptor({
//     this.maxRetries = 3,
//     this.retryDelay = 1,
//   });

//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     for (int i = 0; i <= maxRetries; i++) {
//       // Log the retry attempt
//       if (i > 0) {
//         print(
//             '👮‍♂️👮‍♂️👮‍♂️Retrying request ($i/$maxRetries) to ${options.uri.toString()}');
//       }

//       try {
//         handler.next(options);
//          if (response) {
//         // if (response != null) {
//         //   // Not a server error, return the response
//         //   return response;
//          }
//       } on DioError catch (e) {
//         if (i == maxRetries) {
//           // Reached max retries, re-throw the exception
//           throw e;
//         } else {
//           // Log the error and retry
//           print('👮‍♂️👮‍♂️👮‍♂️Error sending request: ${e.message}');
//           await Future.delayed(Duration(seconds: retryDelay));
//         }
//       }
//     }

//     // Should never reach here
//     throw Exception('👮‍♂️👮‍♂️👮‍♂️Unexpected error in RetryInterceptor');
//   }
// }
// import 'dart:async';
// import 'package:dio/dio.dart';

// class ApiInterceptor extends Interceptor {
//   final String baseUrl;
//   final String accessToken;
//   final String refreshToken;
//   final Dio _dio;

//   ApiInterceptor(this.baseUrl, this.accessToken, this.refreshToken)
//       : _dio = Dio(BaseOptions(baseUrl: baseUrl));

//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // Agrega el token de acceso a todas las solicitudes
//     options.headers["Authorization"] = "Bearer $accessToken";
//     super.onRequest(options, handler);
//     // return super.onRequest(options);
//   }

//   @override
//   Future onError(DioError error, ErrorInterceptorHandler handler) async {
//    if (error.response?.statusCode == 401) {
//       // Si la respuesta es un error de autenticación, intenta renovar el token
//       //RequestOptions options = error.response.request;
//       try {
//          // Obtener un nuevo token de acceso utilizando el token de actualización
//         final response = await _dio.post(
//           '/refresh-token',
//           data: {
//             'refreshToken': refreshToken,
//           },
//         );

//         // Si la solicitud de renovación de token es exitosa, actualiza el token de acceso y reenvía la solicitud original
//         if (response.statusCode == 200) {
//           Map<String, dynamic> responseData = json.decode(response.body);
//           String newAccessToken = responseData['access_token'];
//           options.headers["Authorization"] = "Bearer $newAccessToken";
//           return _dio.request(options.path, options: options);
//         }
//       } catch (e) {
//         // Si hay un error en la solicitud de renovación de token, muestra un mensaje de error personalizado
//         throw DioError(error: "Error al renovar el token de acceso");
//       }
//     } else if (error.type == DioErrorType.connectionTimeout ||
//         error.type == DioErrorType.receiveTimeout) {
//       // Si la solicitud falla debido a un error de tiempo de espera, muestra un mensaje de error personalizado
//       throw DioError(error: "Tiempo de espera de conexión agotado");
//     } else if (error.type == DioErrorType.badResponse) {
//       // Si la solicitud falla debido a un error de servidor o una respuesta inesperada, muestra un mensaje de error personalizado
//       throw DioError(
//           error:
//               "Error al procesar la solicitud. Por favor, inténtalo de nuevo más tarde");
//     }

//     // Si no se maneja el error, rechaza la solicitud original con el error original
//     return super.onError(error);
//   }
// }

