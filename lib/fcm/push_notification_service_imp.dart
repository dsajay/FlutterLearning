import 'package:flutter1/fcm/i_push_notification_service.dart';
import 'package:flutter1/fcm/model/notification_model.dart';

class PushNotificationImpl extends IPushNotificationService{
  @override
  Stream<NotificationModel> get selectNotificationStream => throw UnimplementedError();

  @override
  Future<void> showNotification(NotificationModel notificationModel) {
    throw UnimplementedError();
  }

}