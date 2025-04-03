import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateCart implements UseCase<Cart, UpdateCartParams> {
  final CartRepository repository;

  UpdateCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(UpdateCartParams params) {
    return repository.updateCart(params.cartId, params.updateData);
  }
}

class UpdateCartParams extends Equatable {
  final int cartId;
  final Map<String, dynamic> updateData;

  const UpdateCartParams({required this.cartId, required this.updateData});

  @override
  List<Object> get props => [cartId, updateData];
}