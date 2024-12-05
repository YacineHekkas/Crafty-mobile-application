import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetUserDataUsecase{
  final UserRepo repo;

  GetUserDataUsecase({
    required this.repo
  });

  Future<Either<Failure,UserEntity>> call() async{
    return await repo.getUserData();
  }
}