import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Get All Carts
class GetAllCarts implements UseCase<List<Cart>, NoParams> {
  final CartRepository repository;

  GetAllCarts(this.repository);

  @override
  Future<Either<Failure, List<Cart>>> call(NoParams params) {
    return repository.getAllCarts();
  }
}

// Get Cart By ID
class GetCartById implements UseCase<Cart, CartIdParams> {
  final CartRepository repository;

  GetCartById(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartIdParams params) {
    return repository.getCartById(params.cartId);
  }
}

// Get Cart By User ID
class GetCartByUser implements UseCase<Cart, UserIdParams> {
  final CartRepository repository;

  GetCartByUser(this.repository);

  @override
  Future<Either<Failure, Cart>> call(UserIdParams params) {
    return repository.getCartByUser(params.userId);
  }
}

// Add Cart
class AddCart implements UseCase<Cart, CartDataParams> {
  final CartRepository repository;

  AddCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartDataParams params) {
    return repository.addCart(params.cartData);
  }
}

// Update Cart
class UpdateCart implements UseCase<Cart, UpdateCartParams> {
  final CartRepository repository;

  UpdateCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(UpdateCartParams params) {
    return repository.updateCart(params.cartId, params.updateData);
  }
}

// Delete Cart
class DeleteCart implements UseCase<bool, CartIdParams> {
  final CartRepository repository;

  DeleteCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(CartIdParams params) {
    return repository.deleteCart(params.cartId);
  }
}

// Add Product To Cart
class AddProductToCart implements UseCase<Cart, AddProductParams> {
  final CartRepository repository;

  AddProductToCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(AddProductParams params) {
    return repository.addProductToCart(params.cartId, params.product);
  }
}

// Remove Product From Cart
class RemoveProductFromCart implements UseCase<Cart, CartProductParams> {
  final CartRepository repository;

  RemoveProductFromCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartProductParams params) {
    return repository.removeProductFromCart(params.cartId, params.productId);
  }
}

// Increment Product Quantity
class IncrementProductQuantity implements UseCase<Cart, CartProductParams> {
  final CartRepository repository;

  IncrementProductQuantity(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartProductParams params) {
    return repository.incrementProductQuantity(params.cartId, params.productId);
  }
}

// Decrement Product Quantity
class DecrementProductQuantity implements UseCase<Cart, CartProductParams> {
  final CartRepository repository;

  DecrementProductQuantity(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartProductParams params) {
    return repository.decrementProductQuantity(params.cartId, params.productId);
  }
}

// Clear Cart
class ClearCart implements UseCase<Cart, CartIdParams> {
  final CartRepository repository;

  ClearCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartIdParams params) {
    return repository.clearCart(params.cartId);
  }
}

// Params Classes
class CartIdParams extends Equatable {
  final int cartId;

  const CartIdParams({required this.cartId});

  @override
  List<Object> get props => [cartId];
}

class UserIdParams extends Equatable {
  final int userId;

  const UserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}

class CartDataParams extends Equatable {
  final Map<String, dynamic> cartData;

  const CartDataParams({required this.cartData});

  @override
  List<Object> get props => [cartData];
}

class UpdateCartParams extends Equatable {
  final int cartId;
  final Map<String, dynamic> updateData;

  const UpdateCartParams({required this.cartId, required this.updateData});

  @override
  List<Object> get props => [cartId, updateData];
}

class AddProductParams extends Equatable {
  final int cartId;
  final Map<String, dynamic> product;

  const AddProductParams({required this.cartId, required this.product});

  @override
  List<Object> get props => [cartId, product];
}

class CartProductParams extends Equatable {
  final int cartId;
  final int productId;

  const CartProductParams({required this.cartId, required this.productId});

  @override
  List<Object> get props => [cartId, productId];
}