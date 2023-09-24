import 'package:ortog_citas/app/data/models/system_notification.dart';
import 'package:ortog_citas/app/data/models/user_token_firebase_model.dart';
import 'package:ortog_citas/app/domain/either/either.dart';

abstract class IHandleFirebaseRepository {
  Future<Either<SystemNotification, bool>> saveUserTokenFirebase(
      UserTokenFirebaseModel userTokenFirebaseModel);
}
