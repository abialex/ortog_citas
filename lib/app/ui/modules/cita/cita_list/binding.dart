import 'package:get/get.dart';

import '../../../../data/models/cita/cita_rapida_item_model.dart';
import '../../../../domain/usecases/cita/update_cita_rapida_use_case.dart';
import '../../../global_controllers/carrito_list_controller.dart';
import 'controller.dart';

class CitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateCitaRapidaUC());
    Get.put(CarritoController<CitaRapidaItemModel>());
    Get.put<CitaListController>(CitaListController(Get.find()));
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
