
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/featurs/home/presentation/bloc/get_data_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featurs/home/domain/entities/service_entitie.dart';
import 'featurs/home/presentation/pages/nav_screen.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  // init fcmToken
  final fcmToken = await FirebaseMessaging.instance.getToken();
  final server = locator<Server>();

  // TODO: move this to block when internet is checked and handle errors
  try {
    final res = await server.postData(
      '''
        mutation UpdateFCM(\$token: String!) {
          updateFCM(token: \$token)
        }
      ''', {
        'token': fcmToken
    });

    print(res);
  } catch (e) {
    print(e);
  }

  // TODO: move this from here and customize notification style
  // * handle data messages 
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
   }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget  {

  late List<ServiceEntity> gg;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> locator<GetDataBloc>()..add(CallServerEvent(subCategory: '')),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:NavScreen() ,
        )
    );
      

  }

  // getdata() async{
  //   final serviceUsecase = await GetServicesUseCase(repo: locator()).call('climat');
  //   serviceUsecase.fold(
  //           (l) =>null,
  //           (r){
  //             print(serviceUsecase);
  //           }
  //   );
  //
  // }
}
