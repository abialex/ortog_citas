import 'package:get/get.dart';

import '../../../../domain/usecases/doctor/get_doctor_by_usuario_id.dart';
import 'controller.dart';

class CitaListDotorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetDoctorByUsuarioIdUC());
    Get.put<CitaListDoctorController>(CitaListDoctorController(Get.find()));
  }
}
