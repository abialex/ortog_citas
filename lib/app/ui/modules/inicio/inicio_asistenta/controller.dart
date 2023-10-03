// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/middleware/push_notification_service.dart';
import '../../../../data/models/usuario/message_real_time_model.dart';
import '../../../../data/models/usuario/usuario_responsive.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';
import '../../../global_controllers/snackbar_controller.dart';
import '../../../routes/app_routes.dart';

class InicioAsistentaController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Rx<UsuarioResponsive> user = UsuarioResponsive(
    id: 0,
    sessionKey: "",
    sedes: [],
    roles: [],
    username: "",
    persona: "",
  ).obs;

  Rx<String> titulo = "!Bienvenida a la App de Citas Dentales!".obs;
  Rx<String> mensaje = "- Te permite agregar, y eliminar citas".obs;
  Rx<String> boyd = "".obs;

  @override
  void onReady() async {
    super.onReady();
    user.value = await _localAuthRepository.currentUser ?? user.value;
    update();
    if (Platform.isAndroid) {
      //getUser();
    }
  }

  @override
  void onClose() async {
    super.onClose();

    // void getUser() async {
    //   CollectionReference cr = FirebaseFirestore.instance.collection("users");
    //   QuerySnapshot users = await cr.get();
    //   print("tine ${users.docs.length}");
    //   for (var e in users.docs) {
    //     print("tine ${e.data()}");
    //   }
    // }
  }
}
