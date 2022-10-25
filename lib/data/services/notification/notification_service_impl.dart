import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../constants/notification_settings.dart';
import 'notification_service.dart';

class NotificationServiceImpl implements NotificationService {
  // final FirebaseMessaging _fcm = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // String _deviceToken;

  // String get deviceToken => _deviceToken;

  // Future<void> setDeviceToken() async {
  //   _deviceToken = await _fcm.getToken();
  //   await SecureStorageHelper.setFCMToken(_deviceToken);
  // }

  @override
  Future<void> init() async {
    // await setDeviceToken();
    if (Platform.isIOS) {
      // await _fcm.requestNotificationPermissions(IosNotificationSettings(
      //   alert: true,
      //   badge: true,
      //   sound: true,
      // ));
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestPermission();
    }

    // _fcm.configure(
    //   // Called when the app is in the foreground and we receive a push notification
    //   onMessage: (Map<String, dynamic> message) async {
    //     print('onMessage: $message');
    //   },
    //   // Called when the app has been closed comlpetely and it's opened
    //   // from the push notification.
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print('onLaunch: $message');
    //     _serialiseAndNavigate(message);
    //   },
    //   // Called when the app is in the background and it's opened
    //   // from the push notification.
    //   onResume: (Map<String, dynamic> message) async {
    //     print('onResume: $message');
    //     _serialiseAndNavigate(message);
    //   },
    // );

    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      notificationCategories: [
        DarwinNotificationCategory(
          NotificationSettings.category,
          actions: [
            DarwinNotificationAction.plain(
              NotificationSettings.iOSActionId,
              NotificationSettings.iOSActionName,
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
          ],
          options: {
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
            DarwinNotificationCategoryOption.hiddenPreviewShowSubtitle
          },
        ),
      ],
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  // void _serialiseAndNavigate(Map<String, dynamic> message) {
  //   String body = message['notification']['body'];
  //   String title = message['notification']['title'];
  //   var notificationData = message['data'];
  //   switch (notificationData['page_type']) {
  //     case 'chat':
  //       //Navigate to chat
  //       break;
  //     default:
  //       //DO nothing
  //       break;
  //   }
  // }

  @override
  Future<void> showLocalNotification(
    int id,
    String title,
    String body, {
    String? payload,
    NotificationDetails? notificationDetails,
  }) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      NotificationSettings.channelId,
      NotificationSettings.channelName,
      channelDescription: NotificationSettings.channelDescription,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails ?? platformChannelSpecifics,
      payload: payload,
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    switch (notificationResponse.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        // TODO: handle notificationResponse.payload
        break;
      case NotificationResponseType.selectedNotificationAction:
        // if (notificationResponse?.actionId == navigationActionId) {
        // TODO: handle notificationResponse.payload
        // }
        break;
    }
  }

  void onDidReceiveBackgroundNotificationResponse(
      NotificationResponse notificationResponse) async {
    switch (notificationResponse.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        // TODO: handle notificationResponse.payload
        break;
      case NotificationResponseType.selectedNotificationAction:
        // if (notificationResponse?.actionId == navigationActionId) {
        // TODO: handle notificationResponse.payload
        // }
        break;
    }
  }

  Future<dynamic> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      NotificationSettings.channelId,
      NotificationSettings.channelName,
      channelDescription: NotificationSettings.channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentSound: true,
      presentAlert: true,
      presentBadge: true,
    );
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  @override
  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
