import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class BecomeProviderUsecase{
  final UserRepo repo;

  BecomeProviderUsecase( {
    required this.repo
  });

  Future<Either<Failure,String>> call() async{
    return await repo.becomeProvider( );
  }
}