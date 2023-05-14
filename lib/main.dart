import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/home/presentation/pages/nav_screen.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/pages/introduction/intro_screen.dart';
import 'package:cp_project/features/registration/presentation/pages/login/login_screen.dart';
import 'package:cp_project/features/registration/presentation/pages/signup/signup_screen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/account/presentation/bloc/user_bloc.dart';
import 'features/home/presentation/bloc/get_data_bloc.dart';

import 'features/registration/presentation/pages/signup/signup_next_page.dart';
import 'features/registration/presentation/pages/signup/signup_verification_page.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = locator<AuthBloc>().state;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<DataBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<UserBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: locator<App>().getShowIntro() != null
            ? locator<App>().getUserToken() != null
                ? blocState.isVerified
                    ? const NavScreen()
                    : blocState.currentStep == 2 && blocState.token != null
                        ? const SignupVerificationPage(hasBackArrow: false)
                        : blocState.currentStep == 2 ||
                                blocState.currentStep == 1
                            ? const SignupNextPage(hasBackArrow: false)
                            : const SignupScreen(hasBackArrow: false)
                : const LoginScreen(hasBackArrow: false)
            : const IntroScreen(), // find when to show a login screen
      ),
    );
  }
}
