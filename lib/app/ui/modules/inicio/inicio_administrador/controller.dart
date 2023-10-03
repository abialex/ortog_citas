// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firedart/firestore/firestore.dart';
import 'package:get/get.dart';
import '../../../../data/models/usuario/message_real_time_model.dart';
import '../../../../data/models/usuario/usuario_responsive.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';

class InicioAdministradorController extends GetxController {
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

  Rx<String> titulo = "!Bienvenido a la App de Citas Dentales!".obs;
  Rx<String> mensaje =
      "- Visualiza las citas de tus pacientes de manera fácil y rápida".obs;
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
  }

  void userWIndows() async {
    Firestore fire = Firestore.initialize("slg-cita");
    await fire.collection("users").get().then((value) {
      print(value);
      return null;
    });
  }

  // void getUser() async {
  //   CollectionReference cr = FirebaseFirestore.instance.collection("users");
  //   QuerySnapshot users = await cr.get();
  //   print("tine ${users.docs.length}");
  //   for (var e in users.docs) {
  //     print("tine ${e.data()}");
  //   }
  // }
}
