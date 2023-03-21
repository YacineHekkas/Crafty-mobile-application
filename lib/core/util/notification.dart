import 'package:cp_project/core/util/app.dart';
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
    'high_importance_channel',
    'High importance notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );
  static bool notifSetup = false;

  static Future<void> setupNotificaion() async {
    if (notifSetup) {
      return;
    }

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

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    notifSetup = true;
  }

  static void showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      print('show notif');
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'launch_background',
          ),
        ),
      );
    }
  }
}
