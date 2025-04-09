import 'package:json_annotation/json_annotation.dart';

part 'cart_request_body.g.dart';

@JsonSerializable(createFactory: false)
//  ده الكلاس اللي هتبعت بيه بيانات عشان اضيف حاجة للعربة 
class AddToCartRequestBody {
  final int userId;
  // ليستة بالمنتجات اللي عايزه اضيفها للعربة، وكل منتج له تفاصيله
  final List<CartItemRequestBody> products;

  AddToCartRequestBody({
    required this.userId,
    required this.products,
  });

  Map<String, dynamic> toJson() => _$AddToCartRequestBodyToJson(this);
}

@JsonSerializable(createFactory: false)
// ده الكلاس اللي بيمثل منتج واحد بس هيتضاف للعربة
class CartItemRequestBody {
  final int id;
  final int quantity;

  CartItemRequestBody({
    required this.id,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$CartItemRequestBodyToJson(this);
}