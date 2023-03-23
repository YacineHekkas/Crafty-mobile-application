import 'dart:io';

import 'package:cp_project/core/error/Messages.dart';
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/global/global.dart';
import 'package:cp_project/features/home/data/models/Services_model.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/injection_container.dart';
import 'package:http/http.dart' as http;

import 'data_source.dart';

class DataSourceImpl implements DataSource {
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmIxMTM4YzFhYTJkOWQ5OGVkMzdiMCIsImlhdCI6MTY3OTIyNTM0NiwiZXhwIjoxNzEwNzgyOTQ2fQ.wsa4ZZfuf2ygO4VMpTfk8nFPXQzkSHjo2psiWKlOP5A';
  final server = locator<Server>();
  Map<String, dynamic> myMap = {};
  bool status = true;

  @override
  Future<ServicesModel> getServicesData(String filterCategory,String filterSubCategory) async {
    try {
      checkFilter('category',filterCategory);
      checkFilter('subcategory',filterSubCategory);
      final res = await server.fetchData(
          '''
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
                  ''',
          { 'filter':
              myMap
          }
      );
      print('--------->query data :${res}');
      final result = ServicesModel.fromJson(res.data!);
      return Future.value(result);
    } catch (e, stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerFailure();
    }
  }
  @override
  Future<List<ServiceEntity>> servicesList(String category,String subCategory) async {
    return await getServicesData(category,subCategory)
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
    ).toList());
  }
  @override
  Future<String> createService(String category, String subCategory, String description,List<dynamic> imagesList) async {

    try{
      final res = await server.fetchData(
          '''
                  mutation Mutation(\$record: CreateOneServiceInput!) {
                        createService(record: \$record) {
                            recordId
                        }
                  }
                ''',
        {
          'record': {
            'category': category,
            'description': subCategory,
            'subcategory': description
          }
        }
      );

      print('--------->query data :${res}');

      if (res.data != null ) {
        final id = CreateServiceModel.fromJson(res.data!);

        for (dynamic image in imagesList) {

          await uploadData(image.path, id.createService.recordId);
          if (!status){
            return Future.value(Messages.imagesDidentUpload);
          }

        }

      }else{
        return Future.value(Messages.serviceDidntCreated);
      }


      return Future.value(Messages.uploadSuccess);

    }catch(e,stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerFailure();
    }
  }

  Future  uploadData(imageFilePath, ServiceId) async {
    var request = http.MultipartRequest('POST', Uri.parse('https://crafty-server.azurewebsites.net/api/upload/${ServiceId}'),);
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });

    request.files.add(
        await http.MultipartFile.fromPath(
      'gallery',
      imageFilePath,
          contentType: MediaType('image', 'png'),
    ));

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode != 200){
      status = false;
    }
  }

  Map<String, dynamic> checkFilter(String chosenFilter,dynamic value) {

    if (value != '') {
      myMap.putIfAbsent(chosenFilter, () => value);
    }
    return myMap;
  }

}