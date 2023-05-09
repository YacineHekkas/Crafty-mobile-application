import 'dart:async';
import 'dart:io';

import 'package:cp_project/core/error/Messages.dart';
import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/util/app.dart';
import 'package:cp_project/features/home/data/models/Services_model.dart';
import 'package:cp_project/features/home/domain/entities/service_entitie.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/injection_container.dart';
import 'package:http/http.dart' as http;

import 'data_source.dart';

class DataSourceImpl implements DataSource {
  final server = locator<Server>();
  Map<String, dynamic> myMap = {};
  bool status = true;

  Future<ServicesModel> getServicesData(String filterCategory,String filterSubCategory,String searchingValue,bool isSearching) async {
    try {
      myMap = {};
      isSearching?checkFilter("search", searchingValue):{
        checkFilter('category',filterCategory),
        checkFilter('subcategory',filterSubCategory)
      };

      print(myMap.entries);
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
                                online
                                lastOnline
                                rate
                                rateCount
                                username
                              }
                            }
                          }
                        }
                  ''',
          vars: { 'filter':
              myMap
          },
          cacheFetch: false,
        forceNetworkFetch: true,
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

  Future<List<ServiceEntity>> servicesList(String category,String subCategory,String searchingValue,bool isSearching) async {
    return await getServicesData(category,subCategory,searchingValue,isSearching)
        .then((value) => value.paginateServices.items
        .map(
          (e) => ServiceEntity(
        id: e.id,
        author: e.author,
        category: e.category,
        subcategory: e.subcategory,
        images: e.images,
        description: e.description,
        reviewCount: e.reviewCount,
        reviews: e.reviews,
        hasReviewd: e.hasReviewd,
        user: e.user,
      ),
    ).toList());
  }
  @override

  Future<String> createService(String category, String subCategory, String description,List<dynamic> imagesList,List<dynamic> imagesDisplayList) async {

    try{
      final res = await server.fetchData(
          '''
                  mutation Mutation(\$record: CreateOneServiceInput!) {
                        createService(record: \$record) {
                            recordId
                        }
                  }
                ''',
        vars: {
          'record': {
            'category': category,
            'description': description ,
            'subcategory': subCategory
          }
        }
      );

      print('-----+++---->query data :${res.data}');

      if (res.data != null )
      {
        final id = CreateServiceModel.fromJson(res.data!);
        await uploadData(imagesDisplayList[0].path, id.createService.recordId,"display");
        if (!status){
          return Future.value(Messages.imagesDidentUpload);
        }

        for (dynamic image in imagesList) {

          await uploadData(image.path, id.createService.recordId,"gallery");
          if (!status){
            return Future.value(Messages.imagesDidentUpload);
          }
        }
      } else{
        return Future.value(Messages.serviceDidntCreated);
      }
      return Future.value(Messages.uploadSuccess);
    }catch(e,stackTrace) {
      print('---->$e/////////////$stackTrace');
      throw ServerFailure();
    }
  }

  Future  uploadData(imageFilePath, serviceId, imgType) async {
    int byteCount = 0;
    final httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback = (cert, host, port) => true;
    final request = await httpClient.postUrl( Uri.parse('https://crafty-server.azurewebsites.net/api/upload/$serviceId'),);
    request.headers.set(
      HttpHeaders.authorizationHeader,
      'Bearer ${locator<App>().getUserToken()}',
    );
    final requestMultipart = http.MultipartRequest('POST', request.uri);
    requestMultipart.files.add(
      await http.MultipartFile.fromPath(
        imgType,
        imageFilePath,
        contentType: MediaType('image', 'png'),
      ),
    );
    final byteStream = requestMultipart.finalize();

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!
    );

    request.contentLength = requestMultipart.contentLength;

    final streamUpload = byteStream.transform<List<int>>(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);
          byteCount += data.length;
          print('+++++++++++++++++++++++++++++++++>>$byteCount');
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();


    print('-------------------->>${httpResponse.statusCode}');
    if (httpResponse.statusCode != 200){
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