
import 'package:cp_project/featurs/home/data/models/Services_model.dart';
import 'package:cp_project/featurs/home/data/models/account_model.dart';
import 'package:cp_project/featurs/home/domain/entities/account_entitie.dart';
import 'package:cp_project/featurs/home/domain/entities/service_entitie.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'data_source.dart';

class DataSourceImpl implements DataSource {

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
  Future<ServicesModel> getServicesData(String filterSubCategory) async{

    try{
      GraphQLClient qlClient = GraphQLClient(
        link: _apiLink(),
        cache: GraphQLCache(),
      );
      QueryResult queryResult = await qlClient.query(
          QueryOptions(
              variables: {
                "filter": checkFilter(filterSubCategory)
              },
              document: gql(
                  """
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
                  """
              ),
          )
      );
      print('--------->query data :${queryResult}');
      final result = ServicesModel.fromJson(queryResult.data!);
      return Future.value(result);

    }catch(e,stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerException();
    }
  }

  @override
  Future<List<ServiceEntity>> getServices(String subCategory) async {
    return await getServicesData(subCategory).then(
            (value) => value.paginateServices.items.map(
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
            ).toList()
    );
  }

  // this to be placed in the injection container
  HttpLink _apiLink() {
    return HttpLink("https://crafty-server.azurewebsites.net/api/v1",
        defaultHeaders: {
          "Authorization":
          "ggg eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmIxMTM4YzFhYTJkOWQ5OGVkMzdhMyIsImlhdCI6MTY3ODM3OTg1NSwiZXhwIjoxNzA5OTM3NDU1fQ.DLtg_AfthnCyTOnHnTNCj1k-yzhTnoErLOpXnUnXucw"
        });
  }

  Map<String,dynamic> checkFilter(dynamic value) {
    Map<String, dynamic> myMap = {};
    if (value != '') {
      myMap.putIfAbsent("subcategory", () => value);
    }
    return myMap;
  }

}

