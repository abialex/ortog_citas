import 'package:get/get.dart';

import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../domain/usecases/paciente/get_byid_paciente.dart';
import '../../../../domain/usecases/paciente/update_paciente.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import 'controller.dart';

class PacienteUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePacienteUC());
    Get.lazyPut(() => GetPacienteByIdUC());
    Get.lazyPut(() => PacienteUpdateController(Get.find(), Get.find()));
    //permanent: true para que no se duerma
  }
}
