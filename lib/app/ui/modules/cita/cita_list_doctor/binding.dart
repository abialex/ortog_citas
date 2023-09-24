import 'package:ortog_citas/app/domain/usecases/doctor/get_doctor_by_usuario_id.dart';
import 'package:ortog_citas/app/ui/modules/cita/cita_list_doctor/index.dart';
import 'package:get/get.dart';

class CitaListDotorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetDoctorByUsuarioIdUC());
    Get.put<CitaListDoctorController>(CitaListDoctorController(Get.find()));
  }
}
