
import 'package:cp_project/featurs/home/presentation/bloc/get_data_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featurs/home/domain/entities/service_entitie.dart';
import 'featurs/home/presentation/pages/nav_screen.dart';
import 'injection_container.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
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
