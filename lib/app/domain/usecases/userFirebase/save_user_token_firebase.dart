import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/domain/repository/ihandle_firebase_repository.dart';
import 'package:get/get.dart';

import '../../../core/usecases/usecase_params.dart';
import '../../either/either.dart';

class CreateUserTokenFirebaseUC implements UseCaseParams {
  final IHandleFirebaseRepository _repository =
      Get.find<IHandleFirebaseRepository>();

  @override
  Future<Either<SystemNotification, bool>> call(params) async {
    return await _repository.saveUserTokenFirebase(params);
  }
}
