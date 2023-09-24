import 'index.dart';

import 'package:get/get.dart';

class InicioDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InicioDoctorController(),
    );
  }
}
