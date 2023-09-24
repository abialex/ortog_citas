import 'dart:io';

import 'package:connectivity/connectivity.dart';

class Network {
  static Future<bool> checkInternetConnectivity() async {
    if (Platform.isAndroid) {
      var connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    }

    return true;
  }
}
