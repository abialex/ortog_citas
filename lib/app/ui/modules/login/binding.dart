import 'package:get/get.dart';

import '../../../domain/usecases/userFirebase/save_user_token_firebase.dart';
import 'controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateUserTokenFirebaseUC());
    Get.put<LoginController>(LoginController(Get.find()));
  }
}
