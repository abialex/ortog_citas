import 'package:get/get.dart';
import '../../../../domain/usecases/cita/get_byid_cita.dart';
import 'controller.dart';

class CitaDetalleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetCitaByIdUC());
    Get.lazyPut(() => CitaDetalleController(Get.find()));
    //permanent: true para que no se duerma
  }
}
