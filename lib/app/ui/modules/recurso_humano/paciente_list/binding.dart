import 'package:get/get.dart';

import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../../domain/usecases/paciente/get_filter_paciente.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import 'controller.dart';

class PacienteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CarritoController<PacienteItemModel>());
    Get.lazyPut(() => GetFilterPacienteUC());
    Get.lazyPut(() => PacienteListController(Get.find(), Get.find()));
    //permanent: true para que no se duerma
  }
}
