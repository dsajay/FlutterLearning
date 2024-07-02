import 'package:flutter/foundation.dart';
import 'package:flutter1/fcm/notification_constant.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification{
  static final  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  static Future initNotification() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) {});
    const LinuxInitializationSettings initializationSettingsLinux =
    LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (details) {});
  }

  static Future showNotification({required String title , required String body,required String payload }) async{


    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(NotificationConstant.androidChannelId, NotificationConstant.androidChannelName,
        channelDescription: NotificationConstant.androidChannelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(presentSound: false,);
    const NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);
    if (kIsWeb) {

    }else{
      await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails,payload: payload);
    }

  }
}