// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ortog_citas/app/core/middleware/push_notification_service.dart';
import 'package:ortog_citas/app/data/models/usuario/message_real_time_model.dart';
import 'package:ortog_citas/app/ui/global_controllers/snackbar_controller.dart';
import 'package:ortog_citas/app/ui/routes/app_routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../data/repository_imp/local/local_auth_repository.dart';

class InicioDoctorController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final FirebaseAuth? _auth = Platform.isAndroid ? FirebaseAuth.instance : null;
  StreamSubscription<DatabaseEvent>? listenRealTime;

  StreamSubscription<String>? notificaciones = Platform.isAndroid
      ? PushNotificationService.messagesStream.listen((event) {
          Get.offNamed(AppRoutes.CITA);
          SnackBarController().showSnackBar(
              title: "Notificacion", message: event, color: Colors.red);
        })
      : null;

  Rx<UsuarioResponsive> user = UsuarioResponsive(
    id: 0,
    sessionKey: "",
    sedes: [],
    roles: [],
    username: "",
    persona: "",
  ).obs;

  Rx<String> titulo = "!Doctor(a), Bienvenido a la App de Citas Dentales!".obs;
  Rx<String> mensaje =
      "Visualiza las citas de tus pacientes de manera fácil y rápida".obs;
  Rx<String> boyd = "".obs;

  @override
  void onReady() async {
    super.onReady();
    user.value = await _localAuthRepository.currentUser ?? user.value;
    update();
    if (Platform.isAndroid) {
      getUser();
      listenRealTime = listenToDatabaseChanges();
    }
  }

  void updateData(String id) {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child(id);
    ref.set({
      'titulo': 'la locura estan le',
      'cuerpo': 'mensa de sssss',
      'mensaje': 'locura'
      // Agrega los campos y valores que desees modificar
    }).then((_) {
      print('Datos actualizados correctamente en Firebase Database.');
    }).catchError((error) {
      print('Error al actualizar los datos: $error');
    });
  }

  void createData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('presion');
    DatabaseReference newChildRef = ref.push();

    newChildRef.set({
      'campo1': 'valor1',
      'campo2': 'valor2',
      // Agrega los campos y valores que deseas crear
    }).then((_) {
      print('Datos creados correctamente en Firebase Database.');
    }).catchError((error) {
      print('Error al crear los datos: $error');
    });
  }

  @override
  void onClose() async {
    super.onClose();
    notificaciones?.cancel();
    listenRealTime?.cancel();
  }

  StreamSubscription<DatabaseEvent> listenToDatabaseChanges() {
    final String asistentas = "asistentas";
    return FirebaseDatabase.instance.ref(asistentas).onValue.listen(
      (event) {
        var snapshot = event.snapshot;
        if (snapshot.value != null) {
          final respo = jsonDecode(jsonEncode(snapshot.value));
          MessageRealTimeModel message = MessageRealTimeModel.fromJson(respo);
          titulo.value = message.titulo ?? titulo.value;
          mensaje.value = message.mensaje ?? mensaje.value;
        } else {
          print('No se encontraron datos en la ruta $asistentas.');
        }
      },
    );
  }

  void getListData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('presion');
    DatabaseReference newChildRef = ref.push();
    getDataFromReference((newChildRef));
  }

  void getDataFromReference(DatabaseReference ref) {
    ref.get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        var data = snapshot.value;
        print('Datos en la referencia: $data');
      } else {
        print('No se encontraron datos en la referencia.');
      }
    }).catchError((error) {
      print('Error al obtener los datos: $error');
    });
  }

  void getUser() async {
    CollectionReference cr = FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await cr.get();
    print("tine ${users.docs.length}");
    for (var e in users.docs) {
      print("tine ${e.data()}");
    }
  }

  void checkAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // El usuario está autenticado
      print('tine El usuario está autenticado');
      print('UID del usuario: ${user.uid}');
    } else {
      // El usuario no está autenticado
      print('El usuario no está autenticado');
    }
  }

  void singout() {
    _auth?.signOut();
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential? userCredential = await _auth?.signInWithEmailAndPassword(
        email: 'elcurita1302@gmail.com',
        password: 'metileno300',
      );

      User? user = userCredential?.user;
      // El usuario se autenticó correctamente
    } catch (e) {
      // Ocurrió un error durante la autenticación
    }
  }
}
