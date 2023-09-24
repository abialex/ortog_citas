import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../ui/routes/app_routes.dart';

class Constants {
  static const APY_KEY = "OKOKOKOK";

  static CloseSesion() {
    if (Platform.isAndroid) {
      FirebaseMessaging.instance.deleteToken();
    }
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
