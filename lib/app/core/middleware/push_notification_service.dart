import 'dart:async';

import 'package:ortog_citas/app/data/models/cloud/cloud_message_model.dart';
import 'package:ortog_citas/app/ui/global_controllers/dialog_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<CloudMessageModel> _messageStream =
      new StreamController.broadcast();
  static Stream<CloudMessageModel> get messagesStream => _messageStream.stream;

  static Future<void> initializeApp() async {
    //push
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
  }

  static Future<String?> getTokenFirebase() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      DialogController()
          .showDialog002(title: "Firebase", mensaje: e.toString());
      return null;
    }
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.add(
      CloudMessageModel(
        title: message.notification?.title ?? "--",
        body: message.notification?.body ?? "Sin mensaje",
        data: message.data,
      ),
    );
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    _messageStream.add(
      CloudMessageModel(
        title: message.notification?.title ?? "--",
        body: message.notification?.body ?? "Sin mensaje",
        data: message.data,
      ),
    );
  }

  static Future<void> _onOpenMessageOpenApp(RemoteMessage message) async {
    //cuando se convierte de click notification al abrir el app
    print(message.data);
    _messageStream.add(
      CloudMessageModel(
        title: message.notification?.title ?? "--",
        body: message.notification?.body ?? "Sin mensaje",
        data: message.data,
      ),
    );
  }

  static closeStrams() {
    _messageStream.close();
  }
}
