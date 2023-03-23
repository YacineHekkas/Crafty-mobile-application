import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/data/data_sources/remot_data_source/data_source.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/domain/repositories/get_data_repo.dart';

import 'package:dartz/dartz.dart';


class GetDataRepoImpl extends GetDataRepo{

  final DataSource dataSource;

  GetDataRepoImpl({
    required this.dataSource,
  });



  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices(String category,String subCategory) async {
    try{
      print('repo befor');
      final serviceListData = await dataSource.servicesList(category,subCategory);
      print('repo after');
      return right(serviceListData);
    }catch(e){
      print(e);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createService(String category, String subCategory, String description,List<dynamic> imagesList) async {
    try{
      print('repo befor');
      final result = await dataSource.createService(category, subCategory, description,imagesList);
      print('repo after');
      return right(result);
    }catch(e){
      print(e);
      return left(ServerFailure());
    }
  }

}