import 'package:dartz/dartz.dart';

import '../../../../core/error/failurs.dart';
import '../repositories/get_data_repo.dart';

class CreatServiceUsecase{
  final GetDataRepo repo;

  CreatServiceUsecase({
    required this.repo
  });

  Future<Either<Failure,String>> call(String category, String subCategory, String description, List<dynamic> imagesList) async{
    return await repo.createService(category, subCategory, description,imagesList);
  }


}