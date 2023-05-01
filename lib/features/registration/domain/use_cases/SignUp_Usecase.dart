import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:cp_project/features/registration/domain/repositories/logrepo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../repositories/logrepo.dart';

class SignupUseCase {
  final Logrepo repository;

  SignupUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(UserS users) async {
    return await repository.signUP(users);
  }
}
