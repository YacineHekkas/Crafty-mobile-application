import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class ChangeAvatarUsecase{
  final UserRepo repo;

  ChangeAvatarUsecase( {
    required this.repo
  });

  Future<Either<Failure,Unit>> call( String id, String imgPath) async{
    return await repo.changeAvatarPhoto( id,imgPath);
  }
}