import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../repositories/logrepo.dart';

class LoginUseCase {
  final Logrepo repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(User usera) async {
    return await repository.login(usera);
  }
}
