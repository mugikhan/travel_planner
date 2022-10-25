import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationService {
  // String get deviceToken;

  // Future<void> setDeviceToken();

  Future<void> init();

  Future<void> showLocalNotification(int id, String title, String body,
      {String? payload, NotificationDetails? notificationDetails});

  Future<void> cancelNotification(int id);
}
