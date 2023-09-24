import 'index.dart';

import 'package:get/get.dart';
import '../../../domain/usecases/splash/get_current_user.dart';
import '../../../domain/usecases/get_current_user.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetCurrentUser());

    Get.lazyPut(
      () => SplashController(
        Get.find(),
      ),
    );
  }
}
