import 'package:auto_route/auto_route.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/app.gr.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/registration/presentation/bloc/auth_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/account/presentation/bloc/user_bloc.dart';
import 'features/home/presentation/bloc/get_data_bloc.dart';

import 'injection_container.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // TODO: handle background messages
  print('bak msg');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppConst.darkBlue, // Set the status bar color
  ));

  //Bloc.observer = SimpleBlocObserver();

  await setupLocator();
  await locator<App>().initialize();
  await locator<Server>().initialize();
  await Notificaion.setupNotificaion();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  final blocState = locator<AuthBloc>().state;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<DataBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<UserBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(
          deepLinkBuilder: (deepLink) => DeepLink(
            [getInitialRoute()],
          ),
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  PageRouteInfo<dynamic> getInitialRoute() {
    if (locator<App>().getShowIntro() != null) {
      if (locator<App>().getUserToken() != null) {
        if (!blocState.isVerified || blocState.currentStep == 2) {
          return SignupVerificationRoute(hasBackArrow: false);
        } else if (blocState.isVerified) {
          return const NavRoute();
        } else if (blocState.currentStep != -1) {
          if (blocState.currentStep == 1) {
            return SignupNextRoute(hasBackArrow: false);
          } else {
            return SignupRoute(hasBackArrow: false);
          }
        }
      }
    } else {
      return const IntroRoute();
    }

    return LoginRoute(hasBackArrow: false);
  }
}
