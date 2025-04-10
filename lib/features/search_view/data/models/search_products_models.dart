import 'package:json_annotation/json_annotation.dart';

part 'search_products_models.g.dart';

@JsonSerializable()
class SearchProductResponseModel {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  SearchProductResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory SearchProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductResponseModelToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
