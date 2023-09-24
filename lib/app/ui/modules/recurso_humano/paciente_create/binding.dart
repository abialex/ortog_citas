import 'package:ortog_citas/app/domain/usecases/paciente/create_paciente.dart';
import 'package:ortog_citas/app/ui/modules/login/controller.dart';
import 'package:ortog_citas/app/ui/modules/recurso_humano/paciente_create/controller.dart';
import 'package:get/get.dart';

class PacienteCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePacienteUC());

    Get.lazyPut(() => PacienteCreateController(Get.find()));
    //permanent: true para que no se duerma
    //busca el "........interface" que se implemento en mainbainding  y si no encuentra sale un error
  }
}
