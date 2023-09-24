import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/provider/api/remote/doctor_api.dart';
import 'package:ortog_citas/app/domain/repository/idoctor_repository.dart';
import 'package:get/get.dart';

import '../../../domain/either/either.dart';
import '../../models/system_notification.dart';

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
