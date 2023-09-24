import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/snackbar.dart';
import '../../data/models/container/rol_model.dart';
import '../../data/models/usuario/usuario_responsive.dart';
import '../../data/repository_imp/local/local_auth_repository.dart';
import '../../domain/usecases/authentication/cerrar_sesion_use_case.dart';
import '../routes/routes_menu_slide.dart';
import '../utils/functions/redirect_function.dart';
import 'dialog_controller.dart';
import 'snackbar_controller.dart';

class ThemeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  CerrarSesionUC _cerrarSesionUC = CerrarSesionUC();
  UsuarioResponsive? user;
  RxBool _isThemeDark = false.obs;
  bool get isThemeDark => _isThemeDark.value;
  RolModel? rol;
  RxList<RutasMenu> listRutes = <RutasMenu>[].obs;
  void changeTheme() {
    _isThemeDark.value = !_isThemeDark.value;
    Get.changeThemeMode(_isThemeDark.value ? ThemeMode.dark : ThemeMode.light);
    _localAuthRepository.setIsDark(_isThemeDark.value);
  }

  @override
  void onInit() async {
    super.onInit();
    _isThemeDark = ((await _localAuthRepository.isDark) ?? false).obs;
    user = await _localAuthRepository.currentUser;
    getRutes();
    update();
  }

  @override
  onReady() async {
    super.onReady();
  }

  void getRutes() {
    RolModel? rol;
    try {
      rol = user?.roles[0];
    } catch (e) {
      SnackBarController snackbar = SnackBarController();
    }
    listRutes = Redirects.getRutas(rol?.nombreRol).obs;
    update();
  }

  void logout() async {
    final result = await _cerrarSesionUC.call();
    result.when(left: (systemNotification) {
      DialogController().showDialog001(
        title: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
      );
    }, right: (response) {
      if (response) {
        Constants.CloseSesion();
      } else {
        CustomSnackbar customSnackbar = CustomSnackbar(
          title: "Problemas",
          message: "Consulte al administrador",
        );
        customSnackbar.showSnacbar();
      }
    });
  }
}
