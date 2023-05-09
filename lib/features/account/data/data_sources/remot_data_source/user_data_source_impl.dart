import 'package:cp_project/core/error/failurs.dart';
import 'package:cp_project/core/util/server.dart';
import 'package:cp_project/features/account/data/models/user_model.dart';
import 'package:cp_project/features/account/domain/entities/user_entities.dart';
import 'package:cp_project/injection_container.dart';

class UserDataSourceImpl{
  final server = locator<Server>();

  Future<UserModel> getUserData() async {
    try {
      final res = await server.fetchData(
        '''
          query GetUser {
  fetchUser {
    avatar {
      url
    }
    createdAt
    email
    gender
    location {
      state
      district
    }
    name
    password
    phone
    provider
    tags
    username
  }
}
        ''',
        cacheFetch: false,
        forceNetworkFetch: true,
      );
      print('----USER----->query data :${res.data}');
      final result = UserModel.fromJson(res.data!);
      return Future.value(result);
    } catch (e, stackTrace) {
      print('---->$e///////USERUSERUSER//////$stackTrace');
      throw ServerFailure();
    }
  }

  Future<UserEntity> userInfo() async{
    return await getUserData().then(
            (value) => UserEntity
              (
                avatar: value.fetchUser.avatar,
                createdAt: value.fetchUser.createdAt??'',
                email: value.fetchUser.email,
                gender: value.fetchUser.gender,
                location: value.fetchUser.location,
                name: value.fetchUser.name,
                phone: value.fetchUser.phone,
                password: value.fetchUser.password,
                provider: value.fetchUser.provider,
                tags: value.fetchUser.tags,
                username: value.fetchUser.username
            )
    );
  }
}