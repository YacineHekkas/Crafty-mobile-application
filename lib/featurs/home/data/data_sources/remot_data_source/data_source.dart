import 'package:cp_project/featurs/home/data/models/Services_model.dart';
import 'package:cp_project/featurs/home/data/models/account_model.dart';

import 'package:cp_project/featurs/home/domain/entities/account_entitie.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';

abstract class DataSource{
  Future<UserModel> getUsersData (String filterSubCategory);
  Future<ServicesModel> getServicesData (String filterSubCategory);
  Future<List<AccountEntity>> getUsers(String userId);
  Future<List<ServiceEntity>> getServices(String subCategory);
}