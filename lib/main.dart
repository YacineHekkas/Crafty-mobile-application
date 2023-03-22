import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/home/presentation/bloc/get_data_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/pages/navigation_screen.dart';
import 'injection_container.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO: handle background messages
}

void main() async {
  await setupLocator();
  await locator<Server>().initialize();
  await locator<App>().initialize();
  await Notificaion.setupNotificaion();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> locator<GetDataBloc>()..add(CallServerEvent(subCategory: '')),
        child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConst.appName,
        /* TODO: add themeing options */
        //theme: ThemeData.light(useMaterial3: true),
        //darkTheme: ThemeData.dark(useMaterial3: true),
        home: NavigationScreen(),
      )
    );
  }
}
