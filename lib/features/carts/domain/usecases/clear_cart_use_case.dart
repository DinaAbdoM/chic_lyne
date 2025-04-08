import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ClearCart implements UseCase<Cart, CartIdParams> {
  final CartRepository repository;

  ClearCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartIdParams params) {
    return repository.clearCart(params.cartId);
  }
}

// class CartIdParams extends Equatable {
//   final int cartId;

//   const CartIdParams({required this.cartId});

//   @override
//   List<Object> get props => [cartId];
// }