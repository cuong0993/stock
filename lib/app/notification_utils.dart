import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// onBackgroundMessage handler must be top-level function
// https://github.com/FirebaseExtended/flutterfire/issues/4888
Future<void> onBackgroundMessage(RemoteMessage message) async {
  debugPrint(
    'Handling a background message ${message.messageId}',
  );
}

Future<void> initializeNotification(BuildContext context) async {
  const androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_notification');
  const iOSInitializationSettings = IOSInitializationSettings();
  const initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iOSInitializationSettings,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(
    initializationSettings,
    onSelectNotification: _onSelectNotification,
  );
  const androidNotificationChannel = AndroidNotificationChannel(
    'stock_notification_channel',
    'Stock notifications',
    description: 'Channel to show the app notifications.',
    importance: Importance.max,
  );
  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        androidNotificationChannel,
      );
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  await FirebaseMessaging.instance.requestPermission();
  final message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    debugPrint(
      'FirebaseMessaging.instance.getInitialMessage ${message.data}',
    );
    await plugin.cancelAll();
    // ignore: use_build_context_synchronously
    await _handleMessageData(context, message.data);
  }

  FirebaseMessaging.onMessageOpenedApp.listen((message) async {
    debugPrint(
      'FirebaseMessaging.onMessageOpenedApp ${message.data}',
    );
    await plugin.cancelAll();
    // ignore: use_build_context_synchronously
    await _handleMessageData(context, message.data);
  });

  FirebaseMessaging.onMessage.listen((message) async {
    debugPrint(
      'FirebaseMessaging.onMessage $message',
    );
  });
}

Future<void> _handleMessageData(
  BuildContext context,
  Map<String, dynamic> data,
) async {
  if (data['type'] != null) {
    switch (data['type']) {
      case 'post':
        // await AutoRouter.of(context).push(
        //   DetailPostRoute(
        //     postId: data['id'] as String,
        //     isGoingToComment: false,
        //   ),
        // );
        break;
      case 'meeting':
        // TODO Meeting detail screen.
        break;
      case 'conversation':
        // await AutoRouter.of(context).push(
        //   MessageRoute(
        //     isGoingToMessage: false,
        //     conversationId: data['id'] as String,
        //     userIds: const [],
        //   ),
        // );
        break;
      default:
        break;
    }
  }
}

Future<void> _onSelectNotification(String? payload) async {
  debugPrint('Select notification >>>> $payload');
}
