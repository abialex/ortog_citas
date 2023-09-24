import 'package:get/get.dart';
import '../../global_controllers/dialog_controller.dart';
import '../../routes/app_routes.dart';
import '../../routes/routes_menu_slide.dart';

class Redirects {
  static void redirectToHome(String? rol) {
    switch (rol) {
      case "DEV":
        Get.offNamed(AppRoutes.HOME_ADMINISTRADOR);
        break;

      case "ADMINISTRADOR":
        Get.offNamed(AppRoutes.HOME_ADMINISTRADOR);
        break;

      case "ASISTENTA":
        Get.offNamed(AppRoutes.HOME_ASISTENTA);
        break;

      case "DOCTOR":
        Get.offNamed(AppRoutes.HOME_DOCTOR);
        break;

      default:
        DialogController().showDialog002(
            title: "Ruta no encontrada",
            mensaje:
                "Parece que se recibió una ruta que no está especificada en el aplicativo: $rol",
            twoOptions: false);
        break;
    }
  }

  static List<RutasMenu> getRutas(String? rol) {
    switch (rol) {
      case "DEV":
        return RutasDev;

      case "ADMINISTRADOR":
        return RutasAdmin;

      case "ASISTENTA":
        return RutasAsistente;

      case "DOCTOR":
        return RutasDoctor;

      default:
        DialogController().showDialog001(
            title: "Rol no encontrado",
            mensaje:
                "Parece que se recibió un Rol que no está definido en el aplicativo: $rol",
            twoOptions: false);
        return [];
    }
  }
}
