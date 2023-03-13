import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';
import 'package:cp_project/featurs/home/domain/repositories/get_data_repo.dart';
import 'package:dartz/dartz.dart';

class GetServicesUseCase{
  final GetDataRepo repo;

  GetServicesUseCase({
    required this.repo
  });

  Future<Either<Failure,List<ServiceEntity>>> call(String subCategory) async{
    return await repo.getServices(subCategory);
  }
}