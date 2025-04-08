import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCartById implements UseCase<Cart, CartIdParams> {
  final CartRepository repository;

  GetCartById(this.repository);

   @override
  Future<Either<Failure, Cart>> call(CartIdParams params) async {
    return await repository.getCartById(params.cartId);
  }
}
// class CartIdParams extends Equatable {
//   final int cartId;

//   const CartIdParams({required this.cartId});

//   @override
//   List<Object> get props => [cartId];
// }
