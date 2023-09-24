// // import 'package:get/get.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/data/provider/authentication_api.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/domain/entities/usuario.dart';
// // import 'package:ws_odebin_market_mobile_flutter/app/domain/repository/iauthentication_repository.dart';

import '../../../domain/repository/iconnectivity_repository.dart';

class ConnectivityRepository extends IConnectivityRepository {
  // final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  @override
  Future<bool> hasInternet() async {
    // await Future.delayed(const Duration(seconds: 5));
    // return _api.getCurrentUser();
    return Future.value(true);
  }
}
