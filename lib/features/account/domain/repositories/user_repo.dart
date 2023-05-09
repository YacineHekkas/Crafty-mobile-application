import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo{
  Future<Either<Failure,UserEntity>> getUserData();
}