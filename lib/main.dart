import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/account/presentation/bloc/user_bloc.dart';
import 'features/home/presentation/bloc/get_data_bloc.dart';
import 'features/home/presentation/pages/nav_screen.dart';
import 'features/registration/presentation/pages/Introduction-Screens/IntroductionScreen.dart';
import 'features/registration/presentation/pages/login/loginn.dart';
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
  await locator<App>().initialize();
  await locator<Server>().initialize();
  await Notificaion.setupNotificaion();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=> locator<DataBloc>(),),
            BlocProvider(create: (_)=> locator<UserBloc>(),),
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:locator<App>().getShowIntro() != null ? locator<App>().getUserToken() != null ? NavScreen() : const Loginscreen() : const introductionScreen(),
          )

    );
  }
}
