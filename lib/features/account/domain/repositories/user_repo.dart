import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo{
  Future<Either<Failure,UserEntity>> getUserData();
  Future<Either<Failure,Unit>> changeAvatarPhoto(String id,String imgPath);
  Future<Either<Failure,String>> becomeProvider();
}