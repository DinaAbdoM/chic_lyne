import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';

class DecrementProductQuantity implements UseCase<Cart, CartProductParams> {
  final CartRepository repository;

  DecrementProductQuantity(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartProductParams params) {
    return repository.decrementProductQuantity(params.cartId, params.productId);
  }
}

// class CartProductParams extends Equatable {
//   final int cartId;
//   final int productId;

//   const CartProductParams({required this.cartId, required this.productId});

//   @override
//   List<Object> get props => [cartId, productId];
// }