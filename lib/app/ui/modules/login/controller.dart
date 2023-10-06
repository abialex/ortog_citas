import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ortog_citas/app/ui/theme/app_colors.dart';
import '../../../core/middleware/push_notification_service.dart';
import '../../../core/utils/snackbar.dart';
import '../../../data/models/container/rol_model.dart';
import '../../../data/models/user_token_firebase_model.dart';
import '../../../data/models/usuario/usuario_responsive.dart';
import '../../../data/repository_imp/local/local_auth_repository.dart';
import '../../../domain/repository/iauthentication_repository.dart';
import '../../../domain/usecases/userFirebase/save_user_token_firebase.dart';
import '../../global_controllers/dialog_controller.dart';
import '../../utils/functions/redirect_function.dart';

enum ProgressState { oculto, visible }

class LoginController extends GetxController {
  final IAuthenticationRepository _authenticationRepository =
      Get.find<IAuthenticationRepository>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final CreateUserTokenFirebaseUC _createUserTokenFirebaseUC;

//-----------------------------------------------------RX---------------------------------------------------------
  RxBool oculto = true.obs;
  final lastUpdate = "05/10/2023";
  final version = "1.0.0";

//-----------------------------------------------------RX FIN---------------------------------------------------------

  final usernameText = TextEditingController();
  final passwordText = TextEditingController();
  Rx<ProgressState> loginIconState = ProgressState.oculto.obs;

  LoginController(
    this._createUserTokenFirebaseUC,
  );
  @override
  void onReady() {
    super.onReady();
    getUserName();
  }

  void getUserName() async {
    String? username = await _localAuthRepository.username;
    usernameText.text = username != null ? username : "";
  }

  void setOculto() {
    oculto.value = !oculto.value;
    update();
  }

  void loguear() async {
    loginIconState(ProgressState.visible);
    final result = await _authenticationRepository.login(
        usernameText.text, passwordText.text);
    result.when(
      left: (systemNotifacion) {
        DialogController().showDialog001(
            title: systemNotifacion.titulo,
            mensaje: systemNotifacion.mensaje,
            twoOptions: false);
        loginIconState(ProgressState.oculto);
      },
      right: (response) async {
        UsuarioResponsive user = response;
        loginIconState(ProgressState.oculto);
        if (user.id != 0) {
          RolModel rol = user.roles[0];
          Redirects.redirectToHome(rol.nombreRol);
          _localAuthRepository.setUserName(usernameText.text);

          CustomSnackbar(
            icon: Icon(
              Icons.check,
              color: OrtognaticaColors.white,
            ),
            title: "Bienvenido",
            message: "${user.persona ?? "NN"}",
            backgroundColor: OrtognaticaColors.SLGcolor,
          ).showSnacbar();
        } else {
          CustomSnackbar customSnackbar = CustomSnackbar(
              title: "Credenciales incorrectas",
              message: "Vuelva a ingresar sus datos");
          customSnackbar.showSnacbar();
        }
      },
    );
  }
}
