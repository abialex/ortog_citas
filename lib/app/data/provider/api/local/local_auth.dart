import 'dart:convert';
import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/usuario.dart';
import '../../../models/usuario/usuario_model.dart';

class LocalAuth {
  //TODO LO LOCAL
  static const KEY = "session";
  static const KEYcsrftoken = "Csrftoken";
  static const USERNAME = "username";
  static const DOCTOR_SELECTED = "doctor_selected";
  static const IS_DARK = "isDark";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(UsuarioResponsive requestToken) async {
    UsuarioResponsive userModel = requestToken;
    await _storage.write(key: KEY, value: jsonEncode(userModel.toJson()));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<String?> getCsrftoken() async {
    final String? data = await _storage.read(key: KEYcsrftoken);
    return data;
  }

  Future<String?> getUserName() async {
    final String? data = await _storage.read(key: USERNAME);
    return data;
  }

  Future<UsuarioResponsive?> getCurrentUser() async {
    final String? data = await _storage.read(key: KEY);
    if (data != null) {
      final UsuarioResponsive requestToken =
          UsuarioResponsive.fromJson(jsonDecode(data));
      // var dateTimeSESSION = DateFormat("yyyy-MM-dd HH:mm:ss")
      //     .parse(requestToken.tiempoExpiracion.toString(), true);
      //var dateLocal = dateTime.toLocal();

      var dateUtcNOW = DateTime.now().toUtc();
      // print("dateUtcNOW: $dateUtcNOW");
      // print("dateTimeSESSION: $dateTimeSESSION");

      // if (dateUtcNOW.isBefore(dateTimeSESSION)) {
      //   return requestToken;
      // }
      return requestToken;
    }
    return null;
  }

  Future<void> setCsrftoken(String csrftoken) async {
    await _storage.write(
      key: KEYcsrftoken,
      value: csrftoken,
    );
  }

  Future<void> setUserName(String username) async {
    await _storage.write(
      key: USERNAME,
      value: username,
    );
  }

  Future<DoctorModel?> getDoctorSelected() async {
    final String? data = await _storage.read(key: DOCTOR_SELECTED);
    if (data != null) {
      final DoctorModel requestToken = DoctorModel.fromJson(jsonDecode(data));

      return requestToken;
    }
    return null;
  }

  Future<void> setDoctorSelected(DoctorModel doctorModel) async {
    await _storage.write(
      key: DOCTOR_SELECTED,
      value: jsonEncode(doctorModel.toJson()),
    );
  }

  setIsDark(bool isDark) async {
    await _storage.write(
      key: IS_DARK,
      value: jsonEncode(isDark),
    );
  }

  Future<bool?> getIsDark() async {
    final String? data = await _storage.read(key: IS_DARK);
    if (data != null) {
      if (data == "true") {
        return true;
      } else {
        return false;
      }
    }
    return null;
  }
}
