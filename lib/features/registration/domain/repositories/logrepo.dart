import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:cp_project/features/registration/presentation/bloc/loginBloc/bloc/Auth_bloc.dart';
import 'package:cp_project/features/registration/presentation/pages/zextra/signUP.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';

abstract class Logrepo {
  Future<Either<Failure, Unit>> login(User usera);
  Future<Either<Failure, bool>> isLogIn();
  Future<Either<Failure, Unit>> signUP(UserS users);
  Future<Either<Failure, Unit>> Sendverification();
  Future<Either<Failure, bool>> isverified(String code1);
}
