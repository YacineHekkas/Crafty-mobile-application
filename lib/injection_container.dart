import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/core/util/notification.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source.dart';
import 'package:cp_project/features/chat/data/datasources/remote_data_source/chat_source_impl.dart';
import 'package:cp_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:cp_project/features/home/data/data_sources/remot_data_source/data_source.dart';
import 'package:cp_project/features/home/data/data_sources/remot_data_source/data_source_impl.dart';
import 'package:cp_project/features/home/data/repositories/get_data_repo_impl.dart';
import 'package:cp_project/features/home/domain/use_cases/get_account_usecase.dart';
import 'package:cp_project/features/home/domain/use_cases/get_services_uasecase.dart';
import 'package:get_it/get_it.dart';

import 'features/home/domain/repositories/get_data_repo.dart';
import 'features/home/presentation/bloc/get_data_bloc.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // block
  locator.registerFactory(
          () => GetDataBloc(
              getAccountUseCase: locator(),
              getServicesUseCase: locator()
          )
  );
  locator.registerFactory(
          () => ChatBloc()
  );

  // util
  locator.registerLazySingleton(
          () => Server()
  );
  locator.registerLazySingleton(
          () => Notificaion()
  );
  locator.registerLazySingleton(
          () => App(locator())
  );

  // Use case
  locator.registerLazySingleton(
          () =>GetServicesUseCase(
              repo: locator()
          )
  );
  locator.registerLazySingleton(
          () =>GetAccountUseCase(
          repo: locator()
      )
  );
  // Repo
  locator.registerLazySingleton<GetDataRepo>(
          () => GetDataRepoImpl(
              dataSource: locator()
          ),
  );
  // data source
  locator.registerLazySingleton<DataSource>(
          () => DataSourceImpl()
  );
  locator.registerLazySingleton<ChatSource>(
          () => ChatSourceImpl(server: locator())
  );

}