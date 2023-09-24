import 'package:get/get.dart';

import '../../../core/usecases/usecase_params.dart';
import '../../../data/models/paciente/paciente_model.dart';
import '../../../data/models/system_notification.dart';
import '../../either/either.dart';
import '../../repository/ipaciente_repository.dart';

class GetPacienteByIdUC implements UseCaseParams {
  final IPacienteRepository _repository = Get.find<IPacienteRepository>();

  @override
  Future<Either<SystemNotification, PacienteModel?>> call(params) async {
    return await _repository.getPacienteById(params);
  }
}
