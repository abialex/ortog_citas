import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/core/middleware/push_notification_service.dart';
import 'app/core/utils/dependency_injection.dart';
import 'app/data/models/usuario/usuario_responsive.dart';
import 'app/data/repository_imp/local/local_auth_repository.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await PushNotificationService.initializeApp();
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  await DependencyInjection.init();
  await setHeader();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  runApp(MyApp(await _localAuthRepository.isDark ?? false));
}

setHeader() async {
  final Dio _dio = Get.find<Dio>();
  final LocalAuthRepository _storage = Get.find<LocalAuthRepository>();

  final UsuarioResponsive? usuarioResponsive = await _storage.currentUser;
  final String sessionKey =
      usuarioResponsive != null ? await usuarioResponsive.sessionKey : "";
  String? csrftoken = await _storage.csrftoken;
  csrftoken = csrftoken != null ? csrftoken : "";
  _dio.options.headers = {
    "X-CSRFToken": "${csrftoken}",
    "Cookie": "csrftoken=${csrftoken}; sessionid=${sessionKey}"
  };
}
