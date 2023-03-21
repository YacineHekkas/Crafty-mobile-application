import 'package:cp_project/core/error/exceptions.dart';
import 'package:cp_project/features/home/data/models/Services_model.dart';
import 'package:cp_project/features/home/data/models/account_model.dart';
import 'package:cp_project/features/home/domain/entities/account_entitie.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/injection_container.dart';
import 'data_source.dart';

class DataSourceImpl implements DataSource {
  final server = locator<Server>();
  
  @override
  Future<UserModel> getUsersData(String filterSubCategory) {
    // TODO: implement getDataUsers
    throw UnimplementedError();
  }

  @override
  Future<List<AccountEntity>> getUsers(String userId) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  Future<ServicesModel> getServicesData(String filterSubCategory) async {
    try {
      final res = await server.fetchData('''
                    query Items(\$filter: FilterFindManyServiceInput) {
                          paginateServices(filter: \$filter) {
                            items {
                              _id
                              author
                              category
                              subcategory
                              images {
                                displayImage {
                                  url
                                }
                                images {
                                  url
                                }
                              }
                              description
                              reviewCount
                              reviews {
                                items {
                                  author
                                  description
                                  reviewUser {
                                    username
                                    _id
                                    avatar {
                                      url
                                    }
                                  }
                                  service
                                  createdAt
                                  updatedAt
                                }
                              }
                              hasReviewd
                              user {
                                _id
                                avatar {
                                  url
                                }
                                gender
                                location {
                                  type
                                  state
                                  district
                                  coordinates
                                }
                                name
                                phone
                                provider
                                rate
                                rateCount
                                username
                              }
                            }
                          }
                        }
                  ''', { 'filter': checkFilter(filterSubCategory) });
      print('--------->query data :${res}');
      final result = ServicesModel.fromJson(res.data!);
      return Future.value(result);
    } catch (e, stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerException();
    }
  }

  @override
  Future<List<ServiceEntity>> getServices(String subCategory) async {
    return await getServicesData(subCategory)
        .then((value) => value.paginateServices.items
            .map(
              (e) => ServiceEntity(
                id: e.id,
                author: e.author,
                category: e.category,
                subcategory: e.subcategory,
                // images: e.images,
                description: e.description,
                reviewCount: e.reviewCount,
                reviews: e.reviews,
                hasReviewd: e.hasReviewd,
                user: e.user,
              ),
            )
            .toList());
  }

  Map<String, dynamic> checkFilter(dynamic value) {
    Map<String, dynamic> myMap = {};
    if (value != '') {
      myMap.putIfAbsent("subcategory", () => value);
    }
    return myMap;
  }
}
