// import 'package:ws_odebin_market_mobile_flutter/app/domain/entities/usuario.dart';

abstract class IConnectivityRepository {
  Future<bool> hasInternet();
}
