import 'package:cp_project/featurs/home/data/models/account_model.dart';

class ServicesModel {
  ServicesModel({
    required this.paginateServices,
  });
  late final PaginateServices paginateServices;

  ServicesModel.fromJson(Map<String, dynamic> json){
    paginateServices = PaginateServices.fromJson(json['paginateServices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['paginateServices'] = paginateServices.toJson();
    return _data;
  }
}


class PaginateServices {
  PaginateServices({
    required this.items,
  });
  late final List<Service> items;

  PaginateServices.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>Service.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Service {
  Service({
    required this.id,
    required this.author,
    required this.category,
    required this.subcategory,
    required this.images,
    required this.description,
    required this.reviewCount,
    required this.reviews,
    required this.hasReviewd,
    required this.user,
  });
  late final String id;
  late final String author;
  late final String category;
  late final String subcategory;
  late final Images images;
  late final String description;
  late final int reviewCount;
  late final Reviews reviews;
  late final bool hasReviewd;
  late final User user;

  Service.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    author = json['author'];
    category = json['category'];
    subcategory = json['subcategory'];
    //images = Images.fromJson(json['images']);
    description = json['description'];
    reviewCount = json['reviewCount'];
    reviews = Reviews.fromJson(json['reviews']);
    hasReviewd = json['hasReviewd'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['author'] = author;
    _data['category'] = category;
    _data['subcategory'] = subcategory;
    _data['images'] = images.toJson();
    _data['description'] = description;
    _data['reviewCount'] = reviewCount;
    _data['reviews'] = reviews.toJson();
    _data['hasReviewd'] = hasReviewd;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.avatar,
    required this.gender,
    required this.location,
    required this.name,
    required this.phone,
    required this.provider,
    required this.rate,
    required this.rateCount,
    required this.username,
  });
  late final String id;
  late final Avatar avatar;
  late final String gender;
  late final Location location;
  late final String name;
  late final int phone;
  late final bool provider;
  late final int rate;
  late final int rateCount;
  late final String username;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    avatar = Avatar.fromJson(json['avatar']);
    gender = json['gender'];
    location = Location.fromJson(json['location']);
    name = json['name'];
    phone = json['phone'];
    provider = json['provider'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['avatar'] = avatar.toJson();
    _data['gender'] = gender;
    _data['location'] = location.toJson();
    _data['name'] = name;
    _data['phone'] = phone;
    _data['provider'] = provider;
    _data['rate'] = rate;
    _data['rateCount'] = rateCount;
    _data['username'] = username;
    return _data;
  }
}

class Images {
  Images({
    required this.displayImage,
    required this.images,
  });
  late final DisplayImage displayImage;
  late final List<Images> images;

  Images.fromJson(Map<String, dynamic> json){
    displayImage = DisplayImage.fromJson(json['displayImage']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['displayImage'] = displayImage.toJson();
    _data['images'] = images.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DisplayImage {
  DisplayImage({
    required this.url,
  });
  late final String url;

  DisplayImage.fromJson(Map<String, dynamic> json){
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}

class Reviews {
  Reviews({
    required this.items,
  });
  late final List<Items> items;

  Reviews.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.author,
    required this.description,
    required this.reviewUser,
    required this.service,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String author;
  late final String description;
  late final ReviewUser reviewUser;
  late final String service;
  late final String createdAt;
  late final String updatedAt;

  Items.fromJson(Map<String, dynamic> json){
    author = json['author'];
    description = json['description'];
    reviewUser = ReviewUser.fromJson(json['reviewUser']);
    service = json['service'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['author'] = author;
    _data['description'] = description;
    _data['reviewUser'] = reviewUser.toJson();
    _data['service'] = service;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class ReviewUser {
  ReviewUser({
    required this.username,
    required this.id,
    required this.avatar,
  });
  late final String username;
  late final String id;
  late final Avatar avatar;

  ReviewUser.fromJson(Map<String, dynamic> json){
    username = json['username'];
    id = json['_id'];
    avatar = Avatar.fromJson(json['avatar']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['_id'] = id;
    _data['avatar'] = avatar.toJson();
    return _data;
  }
}



