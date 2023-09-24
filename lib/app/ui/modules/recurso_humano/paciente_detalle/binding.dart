import 'package:get/get.dart';

import '../../../../domain/usecases/paciente/get_byid_paciente.dart';
import 'controller.dart';

class PacienteDetalleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPacienteByIdUC());
    Get.lazyPut(() => PacienteDetalleController(Get.find()));
    //permanent: true para que no se duerma
  }
}
