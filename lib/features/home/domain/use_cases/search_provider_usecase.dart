import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/data/models/Services_model.dart';
import 'package:cp_project/features/home/domain/repositories/get_data_repo.dart';
import 'package:dartz/dartz.dart';

class GetServicesUsecase{
  final GetDataRepo repo;

  GetServicesUsecase({
    required this.repo
  });

  Future<Either<Failure,List<User>>> call(String providerName)  async{
    return await repo.searchProvider(providerName);
  }
}