import 'package:ortog_citas/app/data/models/cita/cita_rapida_item_model.dart';
import 'package:ortog_citas/app/data/models/cita/cita_item_model.dart';
import 'package:ortog_citas/app/ui/modules/cita/cita_list/index.dart';
import 'package:get/get.dart';

import '../../../../data/models/cita/hora_model.dart';
import '../../../global_controllers/carrito_list_controller.dart';

class CitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CarritoController<CitaRapidaItemModel>());
    Get.put(CarritoController<HoraModel>());
    Get.put<CitaListController>(CitaListController());
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
