import 'model/notification_model.dart';

abstract class IPushNotificationService {
  Stream<NotificationModel> get selectNotificationStream;

  Future<void> showNotification(NotificationModel notificationModel);
}
