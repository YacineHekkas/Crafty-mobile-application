import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../entities/User.dart';
import '../repositories/logrepo.dart';

class IsLogInusecase {
  final Logrepo repository;

  IsLogInusecase({required this.repository});

  Future<Either<Failure, bool>> call() async {
    return await repository.isLogIn();
  }
}
