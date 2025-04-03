part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllCartsEvent extends CartEvent {}

class GetCartByIdEvent extends CartEvent {
  final int cartId;

  const GetCartByIdEvent(this.cartId);

  @override
  List<Object> get props => [cartId];
}

class GetCartByUserEvent extends CartEvent {
  final int userId;

  const GetCartByUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddCartEvent extends CartEvent {
  final Map<String, dynamic> cartData;

  const AddCartEvent(this.cartData);

  @override
  List<Object> get props => [cartData];
}

class UpdateCartEvent extends CartEvent {
  final int cartId;
  final Map<String, dynamic> updateData;

  const UpdateCartEvent(this.cartId, this.updateData);

  @override
  List<Object> get props => [cartId, updateData];
}

class DeleteCartEvent extends CartEvent {
  final int cartId;

  const DeleteCartEvent(this.cartId);

  @override
  List<Object> get props => [cartId];
}

class AddProductToCartEvent extends CartEvent {
  final int cartId;
  final Map<String, dynamic> product;

  const AddProductToCartEvent(this.cartId, this.product);

  @override
  List<Object> get props => [cartId, product];
}

class RemoveProductFromCartEvent extends CartEvent {
  final int cartId;
  final int productId;

  const RemoveProductFromCartEvent(this.cartId, this.productId);

  @override
  List<Object> get props => [cartId, productId];
}

class IncrementProductQuantityEvent extends CartEvent {
  final int cartId;
  final int productId;

  const IncrementProductQuantityEvent(this.cartId, this.productId);

  @override
  List<Object> get props => [cartId, productId];
}

class DecrementProductQuantityEvent extends CartEvent {
  final int cartId;
  final int productId;

  const DecrementProductQuantityEvent(this.cartId, this.productId);

  @override
  List<Object> get props => [cartId, productId];
}

class ClearCartEvent extends CartEvent {
  final int cartId;

  const ClearCartEvent(this.cartId);

  @override
  List<Object> get props => [cartId];
}