import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/features/home/domain/repositories/get_data_repo.dart';
import 'package:dartz/dartz.dart';

class GetServicesUsecase{
  final GetDataRepo repo;

  GetServicesUsecase({
    required this.repo
  });

  Future<Either<Failure,List<ServiceEntity>>> call(String category,String subCategory, String searchingValue,bool isSearching) async{
    return await repo.getServices(category,subCategory,searchingValue,isSearching);
  }
}