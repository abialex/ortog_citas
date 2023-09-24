import 'index.dart';
import 'package:get/get.dart';

class NotificacionesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NotificacionesController(),
    );
  }
}
