import 'package:chic_lyne/core/data/models/base_response.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response.g.dart';
//ده بقى بيتعامل مع الداتا اللي جاية من الـ API بعد ما تعمل عمليات على العربة (زي عرض محتوياتها)

@JsonSerializable(createToJson: false)
// ده الكلاس اللي بيمثل الرد اللي جاي من الـ API لما تطلب ليستة العربيات (لو عندك أكتر من عربة للمستخدم)
class CartListResponse extends BaseResponse {
  // ليستة فيها بيانات كل عربة
  final List<CartModel> carts;
  // العدد الكلي للعربيات اللي ممكن تكون موجودة
  final int total;
  // عدد العربيات اللي تم تخطيها في الصفحة دي (لو فيه تقسيم للصفحات)
  final int skip;
  // عدد العربيات اللي معروضة في الصفحة دي
  final int limit;
  CartListResponse({
    required super.message,
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartListResponse.fromJson(Map<String, dynamic> json) =>
      _$CartListResponseFromJson(json);
}

// ده الكلاس اللي بيمثل الرد اللي جاي من الـ API لما تطلب بيانات عربة معينة
@JsonSerializable(createToJson: false)
// يحتوي على بيانات العربة الأساسية
class CartResponse extends BaseResponse {
  // هنا بيكون فيه بيانات العربة نفسها (أوبجكت من كلاس CartModel)
  final CartModel? data;

  CartResponse({required super.message, required this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

// ده الكلاس اللي بيمثل شكل بيانات العربة الواحدة
@JsonSerializable(createToJson: false)
class CartModel {
  // الاي دي بتاع العربة
  final int id;
  // ليستة بالمنتجات اللي موجودة في العربة دي، وكل منتج له تفاصيله (أوبجكت من كلاس CartItemModel)
  final List<CartItemModel> products;
  // السعر الكلي للمنتجات في العربة قبل الخصم
  final int total;
  // السعر الكلي للمنتجات في العربة بعد الخصم
  final int discountedTotal;
  // الاي دي بتاع المستخدم صاحب العربة دي
  final int userId;
  // العدد الكلي للمنتجات المختلفة في العربة
  final int totalProducts;
  // العدد الكلي للكميات من كل المنتجات في العربة
  final int totalQuantity;

  // الكونستركتور بتاع الكلاس، بياخد كل بيانات العربة
  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  // دي الفانكشن اللي بتحول الخريطة اللي جاية من الـ API لأوبجكت من الكلاس ده
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}

// ده الكلاس اللي بيمثل شكل بيانات منتج واحد جوه العربة
@JsonSerializable(createToJson: false)
class CartItemModel {
  // الاي دي بتاع المنتج
  final int id;
  // اسم المنتج
  final Productss? product;
  // سعر المنتج الواحد
  final int price;
  // الكمية الموجودة من المنتج ده في العربة
  final int quantity;
  // السعر الكلي للمنتج ده في العربة (السعر الواحد مضروب في الكمية)
  final int total;
  // نسبة الخصم على المنتج
  final double discountPercentage;
  // السعر بعد الخصم للمنتج الواحد
  final int discountedPrice;

  // الكونستركتور بتاع الكلاس، بياخد كل بيانات المنتج في العربة
  CartItemModel({
    required this.id,
    required this.product,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  // دي الفانكشن اللي بتحول الخريطة اللي جاية من الـ API لأوبجكت من الكلاس ده
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
