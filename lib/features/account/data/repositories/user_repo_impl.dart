import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/account/data/data_sources/remot_data_source/user_data_source_impl.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/features/account/domain/repositories/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserRepoImpl implements UserRepo{
  final UserDataSourceImpl dataSourceImpl;

  UserRepoImpl({required this.dataSourceImpl});
  @override
  Future<Either<Failure, UserEntity>> getUserData() async {

    try{
      print('repo user before');
      final userInfo = await dataSourceImpl.userInfo();
      print('repo user after');
      return right(userInfo);
    }catch(e){
      print(e);
      return left(ServerFailure());
    }
  }
}