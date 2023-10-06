import 'package:ortog_citas/app/data/models/notification/notification_model.dart';

import '../../data/models/system_notification.dart';
import '../../data/models/user_token_firebase_model.dart';
import '../either/either.dart';

abstract class IHandleFirebaseRepository {
  Future<Either<SystemNotification, bool>> saveUserTokenFirebase(
      UserTokenFirebaseModel userTokenFirebaseModel);
  Future<Either<SystemNotification, bool>> sendNotification(
      NotificationModel notificationModel);
}
