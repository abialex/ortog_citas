import 'index.dart';
import 'package:get/get.dart';

class CredencialesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CredencialesController(),
    );
  }
}
