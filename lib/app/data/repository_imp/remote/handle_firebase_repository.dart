import 'package:ortog_citas/app/data/models/user_token_firebase_model.dart';
import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/provider/api/remote/handle_firebase_api.dart';
import 'package:ortog_citas/app/domain/either/either.dart';
import 'package:ortog_citas/app/domain/repository/ihandle_firebase_repository.dart';
import 'package:get/get.dart';

class HandleFirebaseRepository extends IHandleFirebaseRepository {
  final HandleFirebaseAPI _api = Get.find<HandleFirebaseAPI>();

  @override
  Future<Either<SystemNotification, bool>> saveUserTokenFirebase(
      UserTokenFirebaseModel userTokenFirebaseModel) {
    return _api.saveUserTokenFirebase(userTokenFirebaseModel);
  }
}
