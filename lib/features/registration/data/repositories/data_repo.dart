import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/registration/data/data_sources/dataSource.dart';
import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:cp_project/features/registration/domain/repositories/logrepo.dart';
import 'package:cp_project/features/registration/domain/use_cases/is_login_case.dart';
import 'package:cp_project/features/registration/presentation/pages/login/loginn.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class Datarepo extends Logrepo {
  final Datasource dataSource;
  final NetworkInfo networkInfo;

  Datarepo(
    this.networkInfo, {
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> IsLogInusecase() async {
    if (await networkInfo.isConnected) {
      try {
        final onbord = await dataSource.IsLogIn();
        return right(onbord as bool);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> login(User usera) async {
    if (await networkInfo.isConnected) {
      await dataSource.login(usera.password!, usera.indentifier!);
      return right(unit);
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isLogIn() {
    // TODO: implement isLogIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signUP(UserS users) async {
    if (await networkInfo.isConnected) {
      await dataSource.signUP(users);
      return right(unit);
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> Sendverification() async {
    if (await networkInfo.isConnected) {
      await dataSource.Sendverification();
      return right(unit);
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isverified(String code1) {
    throw UnimplementedError();
  }
}
