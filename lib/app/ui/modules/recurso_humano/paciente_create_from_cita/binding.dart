import 'package:get/get.dart';

import '../../../../domain/usecases/paciente/create_paciente_from_cita_use_case.dart';
import 'index.dart';

class PacienteCreateFromCitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePacienteFromCitaUC());
    Get.lazyPut(() => PacienteCreateFromCitaController(Get.find()));
    //permanent: true para que no se duerma
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
