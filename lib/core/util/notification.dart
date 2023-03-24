import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/firebase_options.dart';
import 'package:cp_project/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificaion {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final messaging = FirebaseMessaging.instance;

  static const channel = AndroidNotificationChannel(
    'messages_channel',
    'Messages',
    description: 'Recieved messages notifications',
    importance: Importance.max,
  );

  static Future<void> setupNotificaion() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // TODO: check premissions
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final app = locator<App>();
    try {
      await messaging.getToken();
    } catch (_) {}
    messaging.onTokenRefresh.listen(app.setFCMToken);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // TODO: refactor this to handle data messages with notification
    FirebaseMessaging.onMessage.listen((message) {
      final String? id = message.data['conversation'];
      final bloc = locator<ChatBloc>();

      if (id == null) {
        return;
      }

      bloc.add(LoadConversationsEvent(forceNetworkFetch: true));
      bloc.add(LoadMessagesEvent(id: id, forceNetworkFetch: true));
    });
  }

  static void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            //icon: 'ic_launcher',
          ),
        ),
      );
    }
  }
}
