import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../entities/User.dart';
import '../repositories/logrepo.dart';

class Isverifiednusecase {
  final Logrepo repository;

  Isverifiednusecase({required this.repository});

  Future<Either<Failure, bool>> call(String code1) async {
    return await repository.isverified(code1);
  }
}
