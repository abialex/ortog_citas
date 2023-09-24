import 'package:get/get.dart';

import '../../../../data/models/paciente/paciente_item_model.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import 'controller.dart';

class CitaCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CarritoController<PacienteItemModel>());
    Get.put<CitaCreateController>(CitaCreateController());
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
