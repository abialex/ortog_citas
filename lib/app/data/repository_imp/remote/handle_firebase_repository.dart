import 'package:get/get.dart';

import '../../../domain/either/either.dart';
import '../../../domain/repository/ihandle_firebase_repository.dart';
import '../../models/system_notification.dart';
import '../../models/user_token_firebase_model.dart';
import '../../provider/api/remote/handle_firebase_api.dart';

class HandleFirebaseRepository extends IHandleFirebaseRepository {
  final HandleFirebaseAPI _api = Get.find<HandleFirebaseAPI>();

  @override
  Future<Either<SystemNotification, bool>> saveUserTokenFirebase(
      UserTokenFirebaseModel userTokenFirebaseModel) {
    return _api.saveUserTokenFirebase(userTokenFirebaseModel);
  }
}
