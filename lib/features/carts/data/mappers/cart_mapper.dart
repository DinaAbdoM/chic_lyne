import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';

extension CartModelMapper on CartModel {
  Cart toEntity() {
    if (this.carts != null && this.carts!.isNotEmpty) {
      return Cart(
        id: this.carts![0].id,
        products: this.carts![0].products?.map((productModel) => Product(
          id: productModel.id,
          title: productModel.title,
          price: productModel.price,
          quantity: productModel.quantity,
          total: productModel.total,
          discountPercentage: productModel.discountPercentage,
          discountedTotal: productModel.discountedTotal,
          thumbnail: productModel.thumbnail,
        )).toList(),
        total: this.carts![0].total,
        discountedTotal: this.carts![0].discountedTotal,
        userId: this.carts![0].userId,
        totalProducts: this.carts![0].totalProducts,
        totalQuantity: this.carts![0].totalQuantity,
      );
    }
    
    return Cart();
  }
}

extension CartsModelMapper on Carts {
  Cart toEntity() {
    return Cart(
      id: this.id,
      products: this.products?.map((productModel) => Product(
        id: productModel.id,
        title: productModel.title,
        price: productModel.price,
        quantity: productModel.quantity,
        total: productModel.total,
        discountPercentage: productModel.discountPercentage,
        discountedTotal: productModel.discountedTotal,
        thumbnail: productModel.thumbnail,
      )).toList(),
      total: this.total,
      discountedTotal: this.discountedTotal,
      userId: this.userId,
      totalProducts: this.totalProducts,
      totalQuantity: this.totalQuantity,
    );
  }
}

extension CartModelListMapper on List<CartModel> {
  List<Cart> toEntityList() {
    return map((cartModel) => cartModel.toEntity()).toList();
  }
}