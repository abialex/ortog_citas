import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:ortog_citas/app/domain/either/either.dart';
import 'package:get/get.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/data/provider/authentication_api.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/domain/entities/usuario.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/domain/repository/iauthentication_repository.dart';

import '../../../domain/repository/iauthentication_repository.dart';
import '../../provider/api/remote/authentication_api.dart';

class AuthenticationRepository extends IAuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  @override
  Future<Either<SystemNotification, bool>> autenthicate() async {
    return _api.autenthicate();
  }

  @override
  Future<Either<SystemNotification, UsuarioResponsive>> login(
      String username, String password) {
    return _api.login(username, password);
  }

  @override
  Future<Either<SystemNotification, bool>> logout() {
    return _api.logout();
  }
}
