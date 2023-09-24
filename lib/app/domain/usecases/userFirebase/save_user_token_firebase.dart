import 'package:get/get.dart';

import '../../../core/usecases/usecase_params.dart';
import '../../../data/models/system_notification.dart';
import '../../either/either.dart';
import '../../repository/ihandle_firebase_repository.dart';

class CreateUserTokenFirebaseUC implements UseCaseParams {
  final IHandleFirebaseRepository _repository =
      Get.find<IHandleFirebaseRepository>();

  @override
  Future<Either<SystemNotification, bool>> call(params) async {
    return await _repository.saveUserTokenFirebase(params);
  }
}
