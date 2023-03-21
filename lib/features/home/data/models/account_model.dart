import 'Services_model.dart';

class UserModel {
  UserModel({
    required this.searchUser,
  });
  late final SearchUser searchUser;

  UserModel.fromJson(Map<String, dynamic> json){
    searchUser = SearchUser.fromJson(json['searchUser']);
  }

  Map<String, dynamic> toJson() {
    final _searchUser = <String, dynamic>{};
    _searchUser['searchUser'] = searchUser.toJson();
    return _searchUser;
  }
}

class SearchUser {
  SearchUser({
    required this.items,
  });
  late final List<userItems> items;

  SearchUser.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>userItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class userItems {
  userItems({
    required this.username,
    required this.name,
    required this.gender,
    required this.phone,
    required this.provider,
    required this.location,
    required this.rating,
    required this.avatar,
    required this.tags,
    required this.id,
    required this.createdAt,
    required this.services,
  });
  late final String? username;
  late final String? name;
  late final String? gender;
  late final int? phone;
  late final bool? provider;
  late final Location? location;
  late final Rating? rating;
  late final Avatar? avatar;
  late final List<String>? tags;
  late final String? id;
  late final String? createdAt;
  late final List<Service> services;

  userItems.fromJson(Map<String, dynamic> json){
    username = json['username']??'there is no data in the moment';
    name = json['name']??'there is no data in the moment';
    gender = json['gender']??'there is no data in the moment';
    phone = json['phone']??'there is no data in the moment';
    provider = json['provider'];
    location = Location.fromJson(json['location']);
    rating = Rating.fromJson(json['rating']);
    //avatar = Avatar.fromJson(json['avatar']);
    tags = List.castFrom<dynamic, String>(json['tags']);
    id = json['_id'];
    createdAt = json['createdAt'];
    //services = List.from(json['services']).map((e)=>Service.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['name'] = name;
    _data['gender'] = gender;
    _data['phone'] = phone;
    _data['provider'] = provider;
    _data['location'] = location!.toJson();
    _data['rating'] = rating!.toJson();
    _data['avatar'] = avatar!.toJson();
    _data['tags'] = tags;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
   // _data['services'] = services.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });
  late final String type;
  late final List<double> coordinates;

  Location.fromJson(Map<String, dynamic> json){
    type = json['type'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.raters,
  });
  late final double rate;
  late final List<Raters> raters;

  Rating.fromJson(Map<String, dynamic> json){
    print(json);
    rate = json['rate'];
    raters = List.from(json['raters']).map((e)=>Raters.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rate'] = rate;
    _data['raters'] = raters.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Raters {
  Raters({
    required this.value,
    required this.id,
    this.createdAt,
    this.updatedAt,
  });
  late final int value;
  late final String id;
  late final String? createdAt;
  late final String? updatedAt;

  Raters.fromJson(Map<String, dynamic> json){
    value = json['value'];
    id = json['id'];
    createdAt = null;
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Avatar {
  Avatar({
    required this.url,
  });
  late final String url;

  Avatar.fromJson(Map<String, dynamic> json){
    url = json['url']??"assets/images/placeholder.webp";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}


