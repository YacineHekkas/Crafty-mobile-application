import 'package:cp_project/core/network/network_info.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/account/data/data_sources/remot_data_source/user_data_source_impl.dart';
import 'package:cp_project/features/account/data/repositories/user_repo_impl.dart';
import 'package:cp_project/features/account/domain/use_cases/change_avatar-photo.dart';
import 'package:cp_project/features/account/domain/use_cases/get_user_data_usecase.dart';
import 'package:cp_project/features/account/presentation/bloc/user_bloc.dart';
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

import 'features/account/domain/repositories/user_repo.dart';
import 'features/account/domain/use_cases/become_provider_usecase.dart';
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

T locatorOndemand<T extends Object>(T Function() factoryFunc,
    {String? instanceName}) {
  if (!locator.isRegistered<T>(instanceName: instanceName)) {
    locator.registerSingleton<T>(factoryFunc(), instanceName: instanceName);
  }
  return locator<T>(instanceName: instanceName);
}

ChatMessagesBloc locatorMessagesBloc({required String instanceName}) =>
    locatorOndemand<ChatMessagesBloc>(
      () => ChatMessagesBloc(instance: instanceName),
      instanceName: instanceName,
    );

Future<void> setupLocator() async {
  locator.registerLazySingleton(
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

  // block

  locator.registerLazySingleton(() => UserBloc(
    getUserDataUsecase: locator(),
    changeAvatarUsecase: locator(),
    becomeProviderUsecase: locator(),
    )
  );


  locator.registerLazySingleton(() => DataBloc(
        getServicesUseCase: locator(),
        createServiceUsecase: locator(),
      ));
  locator.registerLazySingleton(() => ChatBloc());

  // util
  locator.registerLazySingleton(() => App());
  locator.registerLazySingleton(() => Server(networkInfo: locator()));
  locator.registerLazySingleton(() => Notificaion());

  // Use case
  locator.registerLazySingleton(() => GetServicesUsecase(repo: locator()));
  locator.registerLazySingleton(() => CreatServiceUsecase(repo: locator()));

  locator.registerLazySingleton(() => GetUserDataUsecase(repo: locator()));
  locator.registerLazySingleton(() => ChangeAvatarUsecase(repo: locator()));
  locator.registerLazySingleton(() => BecomeProviderUsecase(repo: locator()));

  // Repo
  locator.registerLazySingleton<GetDataRepo>(
    () => GetDataRepoImpl(dataSource: locator()),
  );
  locator.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(dataSourceImpl:locator()),
  );
  // data source
  locator.registerLazySingleton(
          () => UserDataSourceImpl()
  );
  locator.registerLazySingleton<DataSource>(() => DataSourceImpl());
  locator.registerLazySingleton<ChatSource>(
      () => ChatSourceImpl(server: locator()));
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}
