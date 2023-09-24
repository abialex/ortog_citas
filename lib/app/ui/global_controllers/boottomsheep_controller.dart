import 'dart:async';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class BottomSheepController extends GetxController {
  RxInt countSeconds = 0.obs;
  Timer? timer;

  void llamarCelular({required celular}) {
    FlutterPhoneDirectCaller.callNumber(celular);
  }
}
