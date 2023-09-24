import 'package:ortog_citas/app/data/models/cita/cita_rapida_item_model.dart';
import 'package:ortog_citas/app/domain/usecases/cita/get_cita_rapida_use_case.dart';
import 'package:get/get.dart';

import '../../../global_controllers/carrito_list_controller.dart';
import 'index.dart';

class CitaRapidaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CarritoController<CitaRapidaItemModel>());
    Get.lazyPut(() => GetCitasRapidasUC());
    Get.lazyPut(() => CitaRapidaListController(Get.find(), Get.find()));

    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
