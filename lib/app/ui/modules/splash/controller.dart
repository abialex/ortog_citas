// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/container/rol_model.dart';
import '../../../data/models/usuario/usuario_responsive.dart';
import '../../../data/repository_imp/local/local_auth_repository.dart';
// import '../../../domain/repository/iauthentication_repository.dart';
import '../../../domain/usecases/get_current_user.dart';
import '../../global_controllers/dialog_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/functions/redirect_function.dart';

class SplashController extends GetxController {
  final GetCurrentUser _getCurrentUser;

  //constructor
  SplashController(this._getCurrentUser);

  bool _hasInternetValue = false;
  bool get hasInternetValue => _hasInternetValue;

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 1));
    final result = await _getCurrentUser.call();
    result.when(
      left: (systemNotification) {
        DialogController().showDialog001(
            icon: Icons.error_outline_outlined,
            title: systemNotification.titulo,
            mensaje: systemNotification.mensaje,
            twoOptions: false);
      },
      right: (response) async {
        if (!response) {
          Get.offAllNamed(AppRoutes.LOGIN);
          return;
        }
        UsuarioResponsive? user = await _localAuthRepository.currentUser;
        RolModel? rol = user?.roles[0];
        Redirects.redirectToHome(rol?.nombreRol);
      },
    );
  }
}
