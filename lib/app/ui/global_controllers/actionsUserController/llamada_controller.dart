import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import '../dialog_controller.dart';

class LlamadasController extends GetxController {
  void llamarCelular({required celular}) {
    if (Platform.isAndroid) {
      FlutterPhoneDirectCaller.callNumber(celular);
    } else {
      DialogController().showDialog001(
          icon: Icons.phone_locked,
          title: "Info",
          mensaje: "solo  disponible en celular",
          twoOptions: false);
    }
  }
}
