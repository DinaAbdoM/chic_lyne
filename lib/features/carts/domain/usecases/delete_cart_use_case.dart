import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:dartz/dartz.dart';

class DeleteCart implements UseCase<bool, CartIdParams> {
  final CartRepository repository;

  DeleteCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(CartIdParams params) {
    return repository.deleteCart(params.cartId);
  }
}

// class CartIdParams extends Equatable {
//   final int cartId;

//   const CartIdParams({required this.cartId});

//   @override
//   List<Object> get props => [cartId];
// }