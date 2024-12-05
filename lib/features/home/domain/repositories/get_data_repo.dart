
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/features/home/data/models/Services_model.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class GetDataRepo{
  Future<Either<Failure,List<ServiceEntity>>> getServices(String category,String subCategory,String searchingValue,bool isSearching);
  Future<Either<Failure,String>> createService(String category, String subCategory, String description,List<dynamic> imagesList,List<dynamic> imagesDisplayList);
  Future<Either<Failure,List<User>>> searchProvider(String providerName);
}