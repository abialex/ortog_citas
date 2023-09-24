import 'package:ortog_citas/app/core/utils/extensions/string_extends.dart';
import 'package:get/get.dart';
import '../../../data/models/response_api_model.dart';
import '../../../data/models/system_notification.dart';
import '../../../domain/either/either.dart';
import '../../../ui/routes/app_routes.dart';
import '../constants.dart';

extension ResponseExtensions on Response {
  static Future<Either<SystemNotification, dynamic>> responseApiFunction(
      bool isRedirect, dynamic data, int? statusCode) async {
    if (statusCode == null) {
      return Either.left(
        SystemNotification(
          titulo: "Status code",
          mensaje: "sin código de respuesta",
          detalle: "",
        ),
      );
    }
    if (statusCode == 302 || isRedirect) {
      return Either.left(
        SystemNotification(
          titulo: "Conexión",
          mensaje: "Sin datos",
          detalle: "",
        ),
      );
    }
    ResponseApiModel responseApi = ResponseApiModel.fromJson(data);
    if (statusCode == 200 || statusCode == 201) {
      return Either.right(responseApi.result);
    } else if (statusCode == 401) {
      Constants.CloseSesion();
      Get.offAllNamed(AppRoutes.LOGIN);
      return Either.left(
        SystemNotification(
          titulo: "Lo sentimos",
          mensaje: "Tu sesión ha expirado.",
          detalle: "",
        ),
      );
    } else if (statusCode == 404) {
      return Either.left(
        SystemNotification(
          titulo: "No encontrado",
          mensaje: "la consulta no se ha encontrado",
          detalle: "",
        ),
      );
    } else if (statusCode == 406) {
      return Either.left(
        SystemNotification(
          titulo: "Token",
          mensaje: responseApi.detail ?? " token no encontrado en el servidor",
          detalle: "",
        ),
      );
    } else if (statusCode == 500) {
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
          mensaje: "${(responseApi.detail ?? "sin detalle")} ${statusCode}",
          detalle: "",
        ),
      );
    }
  }
}
