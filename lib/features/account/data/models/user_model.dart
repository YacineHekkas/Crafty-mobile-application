class UserModel {
  UserModel({
    required this.fetchUser,
  });
  late final FetchUser fetchUser;

  UserModel.fromJson(Map<String, dynamic> json){
    fetchUser = FetchUser.fromJson(json['fetchUser']);
  }
}

class FetchUser {
  FetchUser({
    required this.avatar,
    required this.createdAt,
    required this.email,
    required this.id,
    required this.gender,
    required this.location,
    required this.name,
    required this.phone,
    required this.password,
    required this.provider,
    required this.tags,
    required this.username,
  });
  late final String? avatar;
  late final String? createdAt;
  late final String email;
  late final String id;
  late final String gender;
  late final Location location;
  late final String name;
  late final String phone;
  late final String password;
  late final bool provider;
  late final List<dynamic> tags;
  late final String username;

 FetchUser.fromJson(Map<String, dynamic> json){
    avatar = json['avatar']!=null?json['avatar']['url']:null;
    createdAt = json['createdAt'];
    email = json['email'];
    id = json['_id'];
    gender = json['gender'];
    location = Location.fromJson(json['location']);
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    provider = json['provider'];
    tags = List.castFrom<dynamic, dynamic>(json['tags']);
    username = json['username'];
  }
}


class Location {
  Location({
    required this.state,
    required this.district,
  });
  late final String state;
  late final String district;

  Location.fromJson(Map<String, dynamic> json){
    state = json['state'] ?? "not defined";
    district = json['district'] ?? "not defined";
  }

}