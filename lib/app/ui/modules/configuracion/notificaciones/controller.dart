// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/models/notification/notification_model.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/repository_imp/local/local_auth_repository.dart';
import 'package:ortog_citas/app/domain/repository/idoctor_repository.dart';
import 'package:ortog_citas/app/domain/usecases/userFirebase/send_notification.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';

import '../../../../data/models/usuario/usuario_responsive.dart';

class NotificacionesController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final IDoctorRepository _doctorRepository = Get.find<IDoctorRepository>();
  final SendNotificationUC _sendNotificationUC;

  Rx<UsuarioResponsive> user = UsuarioResponsive(
    id: 0,
    sessionKey: "",
    sedes: [],
    roles: [],
    username: "",
    persona: "",
  ).obs;

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;
  NotificationModel notificationSend =
      NotificationModel(user_id: 0, title: "", message: "", data: {});

  NotificacionesController(
    this._sendNotificationUC,
  );

  @override
  void onReady() async {
    super.onReady();
    user.value = await _localAuthRepository.currentUser ?? user.value;
    _getDoctores();
    update();
    if (Platform.isAndroid) {
      // getUser();
    }
  }

  @override
  void onClose() async {
    super.onClose();
  }

  void getListHoraModelFilterByDoctor(DoctorModel? doctorModel) async {}
  void sendNotification(NotificationModel notificationModel) async {
    final result = await _sendNotificationUC.call(notificationModel);
    result.when(left: (systemNotification) {
      DialogController().showDialog001(
        icon: Icons.person_off,
        title: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
        twoOptions: false,
      );
    }, right: (response) {
      DialogController().showDialog001(
        icon: Icons.message,
        title: "Mensaje enviado",
        mensaje: "",
        twoOptions: false,
      );
    });
  }

  Future<void> _getDoctores() async {
    doctorList.clear();
    final result =
        await _doctorRepository.getPersonasDoctorByIdUsuario(user.value.id);
    result.when(left: (systemNotification) {
      DialogController().showDialog002(
        icon: Icons.error,
        title: systemNotification.titulo,
        mensaje: systemNotification.mensaje,
        twoOptions: false,
      );
    }, right: (response) {
      doctorList.addAll(response);
      update();
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
