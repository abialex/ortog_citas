import 'package:get/get.dart';

import '../../../../domain/usecases/paciente/create_paciente.dart';
import 'controller.dart';

class PacienteCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePacienteUC());

    Get.lazyPut(() => PacienteCreateController(Get.find()));
    //permanent: true para que no se duerma
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
