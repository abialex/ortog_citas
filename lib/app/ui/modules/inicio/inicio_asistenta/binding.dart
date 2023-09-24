import 'index.dart';

import 'package:get/get.dart';

class InicioAsistentaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InicioAsistentaController(),
    );
  }
}
