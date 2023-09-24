import 'package:ortog_citas/app/data/models/doctor/doctor_model.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/domain/either/either.dart';
import 'package:ortog_citas/app/domain/repository/idoctor_repository.dart';
import 'package:get/get.dart';
import '../../../core/usecases/usecase_params.dart';

class GetDoctorByUsuarioIdUC implements UseCaseParams {
  final IDoctorRepository _repository = Get.find<IDoctorRepository>();

  @override
  Future<Either<SystemNotification, DoctorModel?>> call(params) async {
    return await _repository.getDoctorByUsuarioId(params);
  }
}
