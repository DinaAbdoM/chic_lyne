import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCartByUser implements UseCase<Cart, UserIdParams> {
  final CartRepository repository;

  GetCartByUser(this.repository);

  @override
  Future<Either<Failure, Cart>> call(UserIdParams params) {
    return repository.getCartByUser(params.userId);
  }
}

class UserIdParams extends Equatable {
  final int userId;

  const UserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}