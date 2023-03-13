import 'package:cp_project/featurs/home/data/data_sources/remot_data_source/data_source.dart';
import 'package:cp_project/featurs/home/data/data_sources/remot_data_source/data_source_impl.dart';
import 'package:cp_project/featurs/home/data/repositories/get_data_repo_impl.dart';
import 'package:cp_project/featurs/home/domain/use_cases/get_account_usecase.dart';
import 'package:cp_project/featurs/home/domain/use_cases/get_services_uasecase.dart';
import 'package:get_it/get_it.dart';

import 'featurs/home/domain/repositories/get_data_repo.dart';
import 'featurs/home/presentation/bloc/get_data_bloc.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // block
  locator.registerFactory(
          () => GetDataBloc(
              getAccountUseCase: locator(),
              getServicesUseCase: locator()
          )
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
}