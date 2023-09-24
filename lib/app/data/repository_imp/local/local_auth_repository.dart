import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:get/get.dart';

import '../../../domain/entities/usuario.dart';
import '../../models/usuario/usuario_model.dart';
import '../../provider/api/local/local_auth.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(UsuarioResponsive requestToken) =>
      _localAuth.setSession(requestToken);
  Future<void> setUserName(String username) => _localAuth.setUserName(username);

  Future<String?> get username => _localAuth.getUserName();
  Future<UsuarioResponsive?> get currentUser => _localAuth.getCurrentUser();
  Future<DoctorModel?> get doctorSelected => _localAuth.getDoctorSelected();

  Future<void> clearSession() => _localAuth.clearSession();
  Future<String?> get csrftoken => _localAuth.getCsrftoken();
  Future<void> setCsrftoken(String csrftoken) =>
      _localAuth.setCsrftoken(csrftoken);

  Future<void> setDoctorSelected(DoctorModel doctorModel) =>
      _localAuth.setDoctorSelected(doctorModel);

  Future<void> setIsDark(bool isDark) => _localAuth.setIsDark(isDark);

  Future<bool?> get isDark => _localAuth.getIsDark();
}
