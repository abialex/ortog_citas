import 'package:ortog_citas/app/data/models/paciente/paciente_item_model.dart';
import 'package:ortog_citas/app/ui/global_controllers/carrito_list_controller.dart';
import 'package:ortog_citas/app/ui/modules/login/controller.dart';
import 'package:ortog_citas/app/ui/modules/recurso_humano/paciente_create/controller.dart';
import 'package:get/get.dart';

import '../../../../domain/usecases/paciente/get_filter_paciente.dart';
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
