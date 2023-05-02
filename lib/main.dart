import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO: handle background messages
  print('bak msg');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 //Bloc.observer = SimpleBlocObserver();

  await setupLocator();
  await locator<Server>().initialize();
  await locator<App>().initialize();
  await Notificaion.setupNotificaion();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> locator<DataBloc>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:NavScreen(),
        )
    );
  }
}
