// import 'package:json_annotation/json_annotation.dart';
// part 'cart_item.g.dart';
// @JsonSerializable()
// class CartModel {
//   final int id;
//   final int userId;
//   final List<CartProduct> products;
//   final int total;
//   final int discountedTotal;
//   final int totalProducts;
//   final int totalQuantity;
//   CartModel({
//     required this.id,
//     required this.userId,
//     required this.products,
//     required this.total,
//     required this.discountedTotal,
//     required this.totalProducts,
//     required this.totalQuantity,
//   });
//   // دالة لإنشاء سلة فارغة
//   factory CartModel.empty() => CartModel(
//         id: 0,
//         userId: 0,
//         products: [],
//         total: 0,
//         discountedTotal: 0,
//         totalProducts: 0,
//         totalQuantity: 0,
//       );
//   factory CartModel.fromJson(Map<String, dynamic> json) =>
//       _$CartModelFromJson(json);
//   Map<String, dynamic> toJson() => _$CartModelToJson(this);

//   // دالة مساعدة للتحقق إذا كانت السلة فارغة
//   bool get isEmpty => products.isEmpty;
// }
// @JsonSerializable()
// class CartProduct {
//   final int id;
//   final String title;
//   final int price;
//   final int quantity;
//   final int total;
//   final double discountPercentage;
//   final int discountedPrice;
//   final String thumbnail;
//   CartProduct({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.total,
//     required this.discountPercentage,
//     required this.discountedPrice,
//     required this.thumbnail,
//   });
//   // دالة لإنشاء منتج فارغ (اختياري)
//   factory CartProduct.empty() => CartProduct(
//         id: 0,
//         title: '',
//         price: 0,
//         quantity: 0,
//         total: 0,
//         discountPercentage: 0.0,
//         discountedPrice: 0,
//         thumbnail: '',
//       );
//   factory CartProduct.fromJson(Map<String, dynamic> json) =>
//       _$CartProductFromJson(json);
//   Map<String, dynamic> toJson() => _$CartProductToJson(this);
// }
// @JsonSerializable()
// class CartResponse {
//   final List<CartModel> carts;
//   final int total;
//   final int skip;
//   final int limit;
//   CartResponse({
//     required this.carts,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });
//   // دالة لإنشاء رد فارغ (اختياري)
//   factory CartResponse.empty() => CartResponse(
//         carts: [],
//         total: 0,
//         skip: 0,
//         limit: 0,
//       );
//   factory CartResponse.fromJson(Map<String, dynamic> json) =>
//       _$CartResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$CartResponseToJson(this);
// }
// cart_model.dart
import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';
@JsonSerializable()
class CartModel {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  CartModel({this.carts, this.total, this.skip, this.limit});

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class Carts {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts({
    this.id, 
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => _$CartsFromJson(json);
  Map<String, dynamic> toJson() => _$CartsToJson(this);
}

@JsonSerializable()
class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  Products({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}