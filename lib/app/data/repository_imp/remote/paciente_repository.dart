import 'package:get/get.dart';

import '../../../domain/either/either.dart';
import '../../../domain/repository/ipaciente_repository.dart';
import '../../models/paciente/paciente_create_from_cita_model.dart';
import '../../models/paciente/paciente_create_model.dart';
import '../../models/paciente/paciente_item_model.dart';
import '../../models/paciente/paciente_model.dart';
import '../../models/paciente/paciente_update_model.dart';
import '../../models/request_models/paciente_request.dart';
import '../../models/system_notification.dart';
import '../../provider/api/remote/paciente_api.dart';

class PacienteRepository extends IPacienteRepository {
  final PacienteApi _api = Get.find<PacienteApi>();

  @override
  Future<Either<SystemNotification, PacienteModel?>> getPacienteByDni(
      String dni) {
    return _api.getPacienteByDni(dni);
  }

  @override
  Future<Either<SystemNotification, PacienteModel?>> getPacienteById(int id) {
    return _api.getPacienteById(id);
  }

  @override
  Future<Either<SystemNotification, List<PacienteItemModel>>> getFilterPaciente(
      PacienteRequest pacienteRequest) {
    // TODO: implement getFilterPaciente
    return _api.getFilterPaciente(pacienteRequest);
  }

  @override
  Future<Either<SystemNotification, int>> createPaciente(
      PacienteCreateModel pacienteCreateModel) {
    return _api.createPaciente(pacienteCreateModel);
  }

  @override
  Future<Either<SystemNotification, int>> updatePaciente(
      PacienteUpdateModel pacienteCreateModel) {
    return _api.updatePaciente(pacienteCreateModel);
  }

  @override
  Future<Either<SystemNotification, int>> createPacienteFromCita(
      PacienteCreateFromCitaModel pacienteCreateModel) {
    return _api.createPacienteFromCita(pacienteCreateModel);
  }
}
