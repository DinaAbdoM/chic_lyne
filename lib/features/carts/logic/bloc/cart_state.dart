part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class AllCartsLoaded extends CartState {
  final List<Cart> carts;

  const AllCartsLoaded(this.carts);

  @override
  List<Object> get props => [carts];
}

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartAdded extends CartState {
  final Cart cart;

  const CartAdded(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartUpdated extends CartState {
  final Cart cart;

  const CartUpdated(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartDeleted extends CartState {}

class ProductAddedToCart extends CartState {
  final Cart cart;

  const ProductAddedToCart(this.cart);

  @override
  List<Object> get props => [cart];
}

class ProductRemovedFromCart extends CartState {
  final Cart cart;

  const ProductRemovedFromCart(this.cart);

  @override
  List<Object> get props => [cart];
}

class ProductQuantityIncremented extends CartState {
  final Cart cart;

  const ProductQuantityIncremented(this.cart);

  @override
  List<Object> get props => [cart];
}

class ProductQuantityDecremented extends CartState {
  final Cart cart;

  const ProductQuantityDecremented(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartCleared extends CartState {
  final Cart cart;

  const CartCleared(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object> get props => [message];
}