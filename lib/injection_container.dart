import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source_impl.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/home/data/data_sources/remot_data_source/data_source.dart';
import 'package:cp_project/features/home/data/data_sources/remot_data_source/data_source_impl.dart';
import 'package:cp_project/features/home/data/repositories/get_data_repo_impl.dart';
import 'package:cp_project/features/home/domain/use_cases/get_services_uasecase.dart';
import 'package:get_it/get_it.dart';

import 'package:cp_project/features/registration/domain/use_cases/Sendverification.dart';
import 'package:cp_project/features/registration/domain/use_cases/SignUp_Usecase.dart';
import 'package:cp_project/features/registration/domain/use_cases/is_verified_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'features/registration/data/data_sources/dataSource.dart';
import 'features/registration/data/data_sources/data_impl.dart';
import 'features/registration/data/repositories/data_repo.dart';
import 'features/registration/domain/repositories/logrepo.dart';
import 'features/registration/domain/use_cases/is_login_case.dart';
import 'features/registration/domain/use_cases/login_Usecase.dart';
import 'features/registration/presentation/bloc/loginBloc/bloc/Auth_bloc.dart';

import 'features/home/domain/repositories/get_data_repo.dart';
import 'features/home/domain/use_cases/create_service_usecase.dart';
import 'features/home/presentation/bloc/get_data_bloc.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory(
      () => AuthBloc(locator(), locator(), locator(), locator(), locator()));

  // Use case
  locator.registerLazySingleton(() => LoginUseCase(repository: locator()));
  locator.registerLazySingleton(() => IsLogInusecase(repository: locator()));
  locator.registerLazySingleton(() => SignupUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => SendverificationUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => Isverifiednusecase(repository: locator()));

  locator.registerLazySingleton<Logrepo>(
      () => Datarepo(locator(), dataSource: locator()));
  locator.registerLazySingleton<Datasource>(() => Dataimpl());
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // block
  locator.registerFactory(() => DataBloc(
        getServicesUseCase: locator(),
        createServiceUsecase: locator(),
      ));
  locator.registerSingleton(() => DataBloc(
        getServicesUseCase: locator(),
        createServiceUsecase: locator(),
      ));
  // atm, use registerLazySingleton
  locator.registerLazySingleton(() => ChatBloc());

  // util
  locator.registerLazySingleton(() => Server());
  locator.registerLazySingleton(() => Notificaion());
  locator.registerLazySingleton(() => App(locator()));

  // Use case
  locator.registerLazySingleton(() => GetServicesUsecase(repo: locator()));
  locator.registerLazySingleton(() => CreatServiceUsecase(repo: locator()));

  // Repo
  locator.registerLazySingleton<GetDataRepo>(
    () => GetDataRepoImpl(dataSource: locator()),
  );
  // data source
  locator.registerLazySingleton<DataSource>(() => DataSourceImpl());
  locator.registerLazySingleton<ChatSource>(
      () => ChatSourceImpl(server: locator()));
}
