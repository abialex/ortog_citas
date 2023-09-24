import 'package:get/get.dart';

import '../../../core/usecases/usecase_not_params.dart';
import '../../repository/iconnectivity_repository.dart';

class HasInternet implements UseCaseNotParams {
  final IConnectivityRepository _repository =
      Get.find<IConnectivityRepository>();

  //GetCurrentUser(AuthenticationRepository find);

  @override
  Future<bool> call() async {
    return await _repository.hasInternet();
  }
}
