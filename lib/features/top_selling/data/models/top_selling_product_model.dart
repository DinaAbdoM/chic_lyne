import 'package:json_annotation/json_annotation.dart';

part 'top_selling_product_model.g.dart';

@JsonSerializable()
class TopSellingProductModel {
  final int id;
  final String title;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnail;

  TopSellingProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });

  factory TopSellingProductModel.fromJson(Map<String, dynamic> json) =>
      _$TopSellingProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopSellingProductModelToJson(this);
}