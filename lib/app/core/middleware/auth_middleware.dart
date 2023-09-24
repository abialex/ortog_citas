import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../ui/routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();

    bool isLogged = box.read('isLogged') ?? false;

    if (route != AppRoutes.LOGIN) {
      return isLogged ? null : const RouteSettings(name: AppRoutes.LOGIN);
    } else {
      return null; // isLogged ? const RouteSettings(name: AppRoutes.HOME_DOCTOR);
    }
  }
}
