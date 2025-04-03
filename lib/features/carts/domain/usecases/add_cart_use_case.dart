import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddCart implements UseCase<Cart, CartDataParams> {
  final CartRepository repository;

  AddCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(CartDataParams params) {
    return repository.addCart(params.cartData);
  }
}

class CartDataParams extends Equatable {
  final Map<String, dynamic> cartData;

  const CartDataParams({required this.cartData});

  @override
  List<Object> get props => [cartData];
}