
import 'package:cp_project/features/home/data/models/Services_model.dart';

class ServiceEntity{
  ServiceEntity({
    required this.id,
    required this.author,
    required this.category,
    required this.subcategory,
   // required this.images,
    required this.description,
    required this.reviewCount,
    required this.reviews,
    required this.hasReviewd,
    required this.user,
  });
   final String id;
   final String author;
   final String category;
   final String subcategory;
  // final Images images;
   final String description;
   final int reviewCount;
   final Reviews reviews;
   final bool hasReviewd;
   final User user;
}
