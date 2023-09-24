import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/domain/either/either.dart';

abstract class IDoctorRepository {
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdSede(int idsede);
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdUsuario(int idusuario);
  Future<Either<SystemNotification, DoctorModel?>> getDoctorByUsuarioId(
      int usuarioId);
}
