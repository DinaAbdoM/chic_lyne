import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddProductToCart implements UseCase<Cart, AddProductParams> {
  final CartRepository repository;

  AddProductToCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(AddProductParams params) {
    return repository.addProductToCart(params.cartId, params.product);
  }
}

class AddProductParams extends Equatable {
  final int cartId;
  final Map<String, dynamic> product;

  const AddProductParams({required this.cartId, required this.product});

  @override
  List<Object> get props => [cartId, product];
}