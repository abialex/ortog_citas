import 'dart:io';
import 'package:ortog_citas/app/core/utils/snackbar.dart';
import 'package:ortog_citas/app/data/models/user_token_firebase_model.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:ortog_citas/app/data/repository_imp/local/local_auth_repository.dart';
import 'package:ortog_citas/app/domain/repository/iauthentication_repository.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/middleware/push_notification_service.dart';
import '../../../data/models/container/rol_model.dart';
import '../../../domain/usecases/userFirebase/save_user_token_firebase.dart';
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
  final lastUpdate = "11/07/2023";
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

          if (Platform.isAndroid) {
            String? token = await PushNotificationService.getTokenFirebase();
            if (token != null) {
              final userTokenFirebase = UserTokenFirebaseModel(
                idusuario: user.id,
                username: user.username,
                token: token,
              );
              final resultUser =
                  await _createUserTokenFirebaseUC.call(userTokenFirebase);
              resultUser.when(left: (systemNotification) {
                DialogController().showDialog002(
                  icon: Icons.error,
                  title: systemNotification.titulo,
                  mensaje: systemNotification.mensaje,
                  twoOptions: false,
                );
              }, right: (response) {
                //implements
              });
            }
          }

          CustomSnackbar(
            icon: Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
            title: "Bienvenido",
            message: "${user.persona ?? "NN"}",
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
