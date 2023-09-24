import '../../data/models/paciente/paciente_create_from_cita_model.dart';
import '../../data/models/paciente/paciente_create_model.dart';
import '../../data/models/paciente/paciente_item_model.dart';
import '../../data/models/paciente/paciente_model.dart';
import '../../data/models/paciente/paciente_update_model.dart';
import '../../data/models/request_models/paciente_request.dart';
import '../../data/models/system_notification.dart';
import '../either/either.dart';

abstract class IPacienteRepository {
  Future<Either<SystemNotification, PacienteModel?>> getPacienteByDni(
      String dni);
  Future<Either<SystemNotification, PacienteModel?>> getPacienteById(int id);
  Future<Either<SystemNotification, List<PacienteItemModel>>> getFilterPaciente(
      PacienteRequest pacienteRequest);
  Future<Either<SystemNotification, int>> createPaciente(
      PacienteCreateModel pacienteCreateModel);
  Future<Either<SystemNotification, int>> updatePaciente(
      PacienteUpdateModel pacienteCreateModel);
  Future<Either<SystemNotification, int>> createPacienteFromCita(
      PacienteCreateFromCitaModel pacienteCreateModel);
}
