import 'package:cp_project/features/registration/domain/entities/User.dart';
import 'package:cp_project/features/registration/domain/entities/UserS.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../repositories/logrepo.dart';

class SendverificationUseCase {
  final Logrepo repository;

  SendverificationUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.Sendverification();
  }
}
