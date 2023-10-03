// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// import '../../ui/global_controllers/dialog_controller.dart';

// class PushNotificationService {
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//   static String? token;
//   static StreamController<String> _messageStream =
//       new StreamController.broadcast();
//   static Stream<String> get messagesStream => _messageStream.stream;

//   static Future<void> initializeApp() async {
//     //push
//     await Firebase.initializeApp();
//     await FirebaseMessaging.instance.requestPermission();
//     FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
//     FirebaseMessaging.onMessage.listen(_onMessageHandler);
//     FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);
//   }

//   static Future<String?> getTokenFirebase() async {
//     try {
//       return await FirebaseMessaging.instance.getToken();
//     } catch (e) {
//       DialogController()
//           .showDialog002(title: "Firebase", mensaje: e.toString());
//       return null;
//     }
//   }

//   static Future<void> _backgroundHandler(RemoteMessage message) async {
//     _messageStream.add(message.notification?.body ?? "No title");
//   }

//   static Future<void> _onMessageHandler(RemoteMessage message) async {
//     DialogController().showDialog001(
//       icon: Icons.info,
//       title: message.notification?.title ?? "Sin título",
//       mensaje: message.notification?.body ?? "Sin mensaje",
//       twoOptions: false,
//     );
//     //_messageStream.add(message.notification?.body ?? "No title");
//   }

//   static Future<void> _onOpenMessageOpenApp(RemoteMessage message) async {
//     //cuando se convierte de click notification al abrir el app
//     _messageStream.add(message.notification?.body ?? "No title");
//   }

//   static closeStrams() {
//     _messageStream.close();
//   }
// }
