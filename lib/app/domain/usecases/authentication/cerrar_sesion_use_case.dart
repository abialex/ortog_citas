import 'package:get/get.dart';

import '../../../core/usecases/usecase_not_params.dart';
import '../../../data/models/system_notification.dart';
import '../../either/either.dart';
import '../../repository/iauthentication_repository.dart';

class CerrarSesionUC implements UseCaseNotParams {
  final IAuthenticationRepository _repository =
      Get.find<IAuthenticationRepository>();

  @override
  Future<Either<SystemNotification, bool>> call() async {
    return await _repository.logout();
  }
}
