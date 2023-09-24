import 'index.dart';
import 'package:get/get.dart';

class InicioAdministradorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => InicioAdministradorController(),
    );
  }
}
