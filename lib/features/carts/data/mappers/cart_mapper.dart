import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';

extension CartModelMapper on CartModel {
  Cart toEntity() {
    if (carts != null && carts!.isNotEmpty) {
      return Cart(
        id: carts![0].id,
        products: carts![0].products?.map((productModel) => Product(
          id: productModel.id,
          title: productModel.title,
          price: productModel.price,
          quantity: productModel.quantity,
          total: productModel.total,
          discountPercentage: productModel.discountPercentage,
          discountedTotal: productModel.discountedTotal,
          thumbnail: productModel.thumbnail,
        )).toList(),
        total: carts![0].total,
        discountedTotal: carts![0].discountedTotal,
        userId: carts![0].userId,
        totalProducts: carts![0].totalProducts,
        totalQuantity: carts![0].totalQuantity,
      );
    }
    
    return Cart();
  }
}

extension CartsModelMapper on Carts {
  Cart toEntity() {
    return Cart(
      id: id,
      products: products?.map((productModel) => Product(
        id: productModel.id,
        title: productModel.title,
        price: productModel.price,
        quantity: productModel.quantity,
        total: productModel.total,
        discountPercentage: productModel.discountPercentage,
        discountedTotal: productModel.discountedTotal,
        thumbnail: productModel.thumbnail,
      )).toList(),
      total: total,
      discountedTotal: discountedTotal,
      userId: userId,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
    );
  }
}

extension CartModelListMapper on List<CartModel> {
  List<Cart> toEntityList() {
    return map((cartModel) => cartModel.toEntity()).toList();
  }
}