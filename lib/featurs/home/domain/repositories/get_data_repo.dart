import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/featurs/home/domain/entities/account_entitie.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class GetDataRepo{
  Future<Either<Failure,List<AccountEntity>>> getAccount(String userId);
  Future<Either<Failure,List<ServiceEntity>>> getServices(String subCategory);
}