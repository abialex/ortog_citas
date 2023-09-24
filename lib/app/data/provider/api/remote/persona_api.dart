import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/api_exception_handler .dart';
import '../../../../core/utils/extensions/response_extends.dart';
import '../../../../core/utils/logging_interceptor.dart';
import '../../../../domain/either/either.dart';
import '../../../models/persona/persona_sunat_model.dart';
import '../../../models/system_notification.dart';

class PersonaApi {
  final Dio _dio = Get.find<Dio>();

  Future<Either<SystemNotification, PersonaSunatModel?>> getPersonaSunByDni(
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
        "/recurso_humano/persona-sun-by-dni/${dni}",
      );
      final resultApi = await ResponseExtensions.responseApiFunction(
          response.isRedirect, response.data, response.statusCode);
      return await resultApi.when(
        left: (SystemNotification) async {
          //validación extra
          if (response.statusCode == 404) {
            return Either.right(null);
          } else {
            return Either.left(SystemNotification);
          }
        },
        right: (response) async {
          PersonaSunatModel paciente = PersonaSunatModel.fromJson(response);
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
}
