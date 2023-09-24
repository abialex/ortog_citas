// import 'package:ws_odebin_market_mobile_flutter/app/domain/entities/usuario.dart';

import '../../data/models/system_notification.dart';
import '../../data/models/usuario/usuario_responsive.dart';
import '../either/either.dart';

abstract class IAuthenticationRepository {
  Future<Either<SystemNotification, bool>> autenthicate();
  Future<Either<SystemNotification, UsuarioResponsive>> login(
      String username, String password);
  Future<Either<SystemNotification, bool>> logout();
}
