import 'package:get/get.dart';
import '../../../core/usecases/usecase_params.dart';
import '../../../data/models/doctor/doctor_model.dart';
import '../../../data/models/system_notification.dart';
import '../../either/either.dart';
import '../../repository/idoctor_repository.dart';

class GetDoctorByUsuarioIdUC implements UseCaseParams {
  final IDoctorRepository _repository = Get.find<IDoctorRepository>();

  @override
  Future<Either<SystemNotification, DoctorModel?>> call(params) async {
    return await _repository.getDoctorByUsuarioId(params);
  }
}
