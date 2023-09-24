import '../../data/models/doctor/doctor_model.dart';
import '../../data/models/system_notification.dart';
import '../either/either.dart';

abstract class IDoctorRepository {
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdSede(int idsede);
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdUsuario(int idusuario);
  Future<Either<SystemNotification, DoctorModel?>> getDoctorByUsuarioId(
      int usuarioId);
}
