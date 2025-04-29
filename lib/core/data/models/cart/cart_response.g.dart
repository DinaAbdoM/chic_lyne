// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListResponse _$CartListResponseFromJson(Map<String, dynamic> json) =>
    CartListResponse(
      message: json['message'] as String,
      carts:
          (json['carts'] as List<dynamic>)
              .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
  message: json['message'] as String,
  data:
      json['data'] == null
          ? null
          : CartModel.fromJson(json['data'] as Map<String, dynamic>),
);

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  id: (json['id'] as num).toInt(),
  products:
      (json['products'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num).toInt(),
  discountedTotal: (json['discountedTotal'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  totalProducts: (json['totalProducts'] as num).toInt(),
  totalQuantity: (json['totalQuantity'] as num).toInt(),
);

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: (json['id'] as num).toInt(),
      product:
          json['product'] == null
              ? null
              : Productss.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountedPrice: (json['discountedPrice'] as num).toInt(),
    );
