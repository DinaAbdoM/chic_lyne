// import 'package:chic_lyne/core/error/failures.dart';
// import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
// import 'package:dartz/dartz.dart';

// abstract class UseCase<Type, Params> {
//   Future<Either<Failure, Type>> call(Params params);
// }

// class NoParams {
//   const NoParams();
// }

// class CartParams {
//   final Carts cart;
//   final Products? product;
//   const CartParams({required this.cart, this.product});
// }

// class UpdateCartParams {
//   final int cartId;
//   final Map<String, dynamic> updateData;
//   // final Carts updatedCart;

//   const UpdateCartParams({required this.cartId, required this.updateData});
// }

// class DeleteCartParams {
//   final int cartId;

//   const DeleteCartParams({required this.cartId});
// }

// class AddProductToCartParams {
//   final int cartId;
//   final Products product;

//   const AddProductToCartParams({required this.cartId, required this.product});
// }

// class RemoveProductFromCartParams {
//   final int cartId;
//   final Products product;

//   const RemoveProductFromCartParams({
//     required this.cartId,
//     required this.product,
//   });
// }

// class IncrementProductQuantityParams {
//   final int cartId;
//   final Products product;

//   const IncrementProductQuantityParams({
//     required this.cartId,
//     required this.product,
//   });
// }

// class DecrementProductQuantityParams {
//   final int cartId;
//   final Products product;

//   const DecrementProductQuantityParams({
//     required this.cartId,
//     required this.product,
//   });
// }

// class ClearCartParams {
//   final int cartId;

//   const ClearCartParams({required this.cartId});
// }

// class GetCartByUserParams {
//   final Carts carts;

//   GetCartByUserParams(this.carts);
// }

import 'package:chic_lyne/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class CartIdParams extends Equatable {
  final int cartId;

  const CartIdParams({required this.cartId});

  @override
  List<Object> get props => [cartId];
}

// In cart use case parameter files
// class CartIdParams extends Equatable {
//   final int cartId; 
  
//   const CartIdParams({required this.cartId});
  
//   @override
//   List<Object> get props => [cartId];
// }

// class UserIdParams extends Equatable {
//   final String userId;
  
//   const UserIdParams({required this.userId});
  
//   @override
//   List<Object> get props => [userId];
// }

// class CartDataParams extends Equatable {
//   final Map<String, dynamic> cartData;
  
//   const CartDataParams({required this.cartData});
  
//   @override
//   List<Object> get props => [cartData];
// }

// class UpdateCartParams extends Equatable {
//   final String cartId;
//   final Map<String, dynamic> updateData;
  
//   const UpdateCartParams({
//     required this.cartId, 
//     required this.updateData
//   });
  
//   @override
//   List<Object> get props => [cartId, updateData];
// }

// class AddProductParams extends Equatable {
//   final String cartId;
//   final Map<String, dynamic> product;
  
//   const AddProductParams({
//     required this.cartId,
//     required this.product
//   });
  
//   @override
//   List<Object> get props => [cartId, product];
// }

// class CartProductParams extends Equatable {
//   final String cartId;
//   final String productId;
  
//   const CartProductParams({
//     required this.cartId,
//     required this.productId
//   });
  
//   @override
//   List<Object> get props => [cartId, productId];
// }