class ServicesModel {
  ServicesModel({
    required this.paginateServices,
  });
  late final PaginateServices paginateServices;

  ServicesModel.fromJson(Map<String, dynamic> json) {
    paginateServices = PaginateServices.fromJson(json['paginateServices']);
  }
}

class PaginateServices {
  PaginateServices({
    required this.items,
  });
  late final List<Service> items;

  PaginateServices.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Service.fromJson(e)).toList();
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

  Service.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    author = json['author'];
    category = json['category'];
    subcategory = json['subcategory'];
    images = Images.fromJson(json['images']);
    description = json['description'];
    reviewCount = json['reviewCount'];
    reviews = Reviews.fromJson(json['reviews']);
    hasReviewd = json['hasReviewd'];
    user = User.fromJson(json['user']);
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
    required this.service,
    required this.lastOnline,
    required this.online,
  });
  late final String id;
  late final Avatar avatar;
  late final String gender;
  late final Location location;
  late final String name;
  late final dynamic phone;
  late final bool provider;
  late final bool online;
  late final DateTime? lastOnline;

  late final int rate;
  late final int rateCount;
  late final String username;
  late final List<Service> service;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    avatar = Avatar.fromJson(json['avatar']);
    gender = json['gender'];
    location = Location.fromJson(json['location']);
    name = json['name'];
    online = json['online'];
    lastOnline = json['lastOnline'] != null
        ? DateTime.parse(json['lastOnline']).toLocal()
        : null;
    phone = json['phone'];
    provider = json['provider'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    username = json['username'];
  }
}

class Images {
  Images({
    required this.displayImage,
    required this.images,
  });
  late final Image displayImage;
  late final List<Image>? images;

  Images.fromJson(Map<String, dynamic> json) {
    json['displayImage'] != null
        ? displayImage = Image.fromJson(json['displayImage'])
        : displayImage = Image(
            url:
                "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80");
    images = json['images'] != null
        ? List.from(json['images']).map((e) => Image.fromJson(e)).toList()
        : null;
  }
}

class Image {
  Image({
    required this.url,
  });
  late final String url;

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}

class Reviews {
  Reviews({
    required this.items,
  });
  late final List<Items> items;

  Reviews.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items.map((e) => e.toJson()).toList();
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

  Items.fromJson(Map<String, dynamic> json) {
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

  ReviewUser.fromJson(Map<String, dynamic> json) {
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
  Location(
      {required this.type,
      required this.coordinates,
      required this.state,
      required this.district});
  late final String state;
  late final String district;
  late final String type;
  late final List<double> coordinates;

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    state = json['state']??"not defined";

    district = json['district']??"not defined";

    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class CreateServiceModel {
  CreateServiceModel({
    required this.createService,
  });
  late final CreateService createService;

  CreateServiceModel.fromJson(Map<String, dynamic> json) {
    createService = CreateService.fromJson(json['createService']);
  }
}

class CreateService {
  CreateService({
    required this.recordId,
  });
  late final String recordId;

  CreateService.fromJson(Map<String, dynamic> json) {
    recordId = json['recordId'];
  }
}
