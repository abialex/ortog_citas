import 'package:ortog_citas/app/domain/usecases/userFirebase/send_notification.dart';

import 'index.dart';
import 'package:get/get.dart';

class NotificacionesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendNotificationUC());
    Get.lazyPut(
      () => NotificacionesController(Get.find()),
    );
  }
}
