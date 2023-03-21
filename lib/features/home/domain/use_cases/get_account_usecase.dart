import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/domain/entities/account_entitie.dart';
import 'package:cp_project/features/home/domain/repositories/get_data_repo.dart';
import 'package:dartz/dartz.dart';

class GetAccountUseCase{
  final GetDataRepo repo;

  GetAccountUseCase({
    required this.repo
  });

  Future<Either<Failure,List<AccountEntity>>> call(String userId) async{
    return await repo.getAccount(userId);
  }
}