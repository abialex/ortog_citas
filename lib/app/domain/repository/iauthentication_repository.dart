// import 'package:ws_odebin_market_mobile_flutter/app/domain/entities/usuario.dart';

import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/models/usuario/usuario_responsive.dart';
import 'package:ortog_citas/app/domain/either/either.dart';

abstract class IAuthenticationRepository {
  Future<Either<SystemNotification, bool>> autenthicate();
  Future<Either<SystemNotification, UsuarioResponsive>> login(
      String username, String password);
  Future<Either<SystemNotification, bool>> logout();
}
