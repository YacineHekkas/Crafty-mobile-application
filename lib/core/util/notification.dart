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

  static const channel = AndroidNotificationChannel(
    'messages_channel',
    'Messages',
    description: 'Recieved messages notifications',
    importance: Importance.max,
  );

  static const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true);

  static const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  static Future<void> setupNotificaion() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final messaging = FirebaseMessaging.instance;

    try {
      final app = locator<App>();
      final ts = app.getFCMTokenTimestamp();

      messaging.onTokenRefresh.listen(app.setFCMToken);

      if (ts == null ||
          DateTime.now().difference(DateTime.parse(ts)).inHours > 3) {
        // TODO: this should be in weeks as the docs say...
        await messaging.deleteToken();

        app.setFCMTokenTimestamp();
      }
      await messaging.getToken();
    } catch (_) {}

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

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
      final String event = message.data['event'];
      final String? conversation = message.data['conversation'];
      final String? id = message.data['id'];
      final String? typing = message.data['typing'];
      final bloc = locator<ChatBloc>();
      final msgBloc = conversation != null
          ? locatorMessagesBloc(instanceName: conversation)
          : null;

      print('fore $event');

      print('fore $conversation');
      print('fore $id');
      print('fore $typing');

      if (conversation != null && event == 'MESSAGE_TYPING') {
        msgBloc!.add(
          UpdateMessage(
            typing == 'true' ? MessageStatus.typing : MessageStatus.none,
          ),
        );

        return;
      }

      if (conversation != null || typing == null) {
        bloc.add(
          const FetchConversations(forceRefresh: true, forceNetworkFetch: true),
        );
      }

      if (id != null && conversation != null) {
        msgBloc!.add(
          UpdateMessage(
            event == 'MESSAGE_SEEN'
                ? MessageStatus.seen
                : event == 'MESSAGE_EDITED'
                    ? MessageStatus.edit
                    : event == 'MESSAGE_DELETED'
                        ? MessageStatus.remove
                        : MessageStatus.none,
            id: id,
          ),
        );

        return;
      }

      if (message.notification != null && !msgBloc!.state.isChatOpen) {
        showNotification(message.notification!);
      }

      if (conversation != null) {
        msgBloc!.add(
          FetchMessages(conversation,
              forceRefresh: true, forceNetworkFetch: true),
        );
      }
    });
  }

  static void showNotification(RemoteNotification notification) =>
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
        ),
      );
}
