import 'package:get/get.dart';

import '../../../domain/either/either.dart';
import '../../../domain/repository/idoctor_repository.dart';
import '../../models/doctor/doctor_model.dart';
import '../../models/system_notification.dart';
import '../../provider/api/remote/doctor_api.dart';

class DoctorRepository extends IDoctorRepository {
  final DoctorAPI _api = Get.find<DoctorAPI>();

  @override
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdSede(int idsede) {
    return _api.getDoctoresById(idsede);
  }

  @override
  Future<Either<SystemNotification, List<DoctorModel>>>
      getPersonasDoctorByIdUsuario(int idusuario) {
    return _api.getDoctoresByIdUsuario(idusuario);
  }

  @override
  Future<Either<SystemNotification, DoctorModel?>> getDoctorByUsuarioId(
      int usuarioId) {
    return _api.getDoctorByIdUsuario(usuarioId);
  }
}
