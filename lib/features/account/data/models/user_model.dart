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
    required this.gender,
    required this.location,
    required this.name,
    required this.phone,
    required this.password,
    required this.provider,
    required this.tags,
    required this.username,
  });
  late final Avatar? avatar;
  late final String? createdAt;
  late final String email;
  late final String gender;
  late final Location location;
  late final String name;
  late final String phone;
  late final String password;
  late final bool provider;
  late final List<dynamic> tags;
  late final String username;

 FetchUser.fromJson(Map<String, dynamic> json){
    avatar = json['avatar''url'];
    createdAt = json['createdAt'];
    email = json['email'];
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

class Avatar {
  Avatar({
    required this.url,
  });
  late final String url;

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? "assets/images/placeholder.webp";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
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