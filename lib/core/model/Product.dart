import 'package:marketshitfchaitanya/core/model/ColorWay.dart';
import 'package:marketshitfchaitanya/core/model/ProductSize.dart';
import 'package:marketshitfchaitanya/core/model/Review.dart';

class Product {
  List<String> image;
  String name;
  int price;
  double rating;
  String description;
  List<ColorWay> colors;
  List<ProductSize> sizes;
  List<Review> reviews;
  String storeName;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    required this.colors,
    required this.sizes,
    required this.reviews,
    required this.storeName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: List<String>.from(json['image'] ?? []),
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      rating: json['rating'] ?? 0.0,
      description: json['description'] ?? '',
      colors: (json['colors'] as List<dynamic>?)
              ?.map((data) => ColorWay.fromJson(data))
              .toList() ??
          [],
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((data) => ProductSize.fromJson(data))
              .toList() ??
          [],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((data) => Review.fromJson(data))
              .toList() ??
          [],
      storeName: json['store_name'] ?? '',
    );
  }
}
