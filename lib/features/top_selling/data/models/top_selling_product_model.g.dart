// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_selling_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopSellingProductModel _$TopSellingProductModelFromJson(
  Map<String, dynamic> json,
) => TopSellingProductModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  thumbnail: json['thumbnail'] as String,
);

Map<String, dynamic> _$TopSellingProductModelToJson(
  TopSellingProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': instance.price,
  'discountPercentage': instance.discountPercentage,
  'rating': instance.rating,
  'stock': instance.stock,
  'thumbnail': instance.thumbnail,
};
