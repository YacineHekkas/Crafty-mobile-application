

import 'package:cp_project/features/home/domain/entities/service_entitie.dart';

abstract class DataSource{


  Future<List<ServiceEntity>> servicesList(String category ,String subCategory,String searchingValue,bool isSearching);

  Future<String> createService(String category, String subCategory, String description,List<dynamic> imagesList,List<dynamic> imagesDisplayList);
}