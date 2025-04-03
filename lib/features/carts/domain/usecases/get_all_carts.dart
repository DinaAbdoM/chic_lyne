import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/core/usecases/usecase.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';

class GetAllCarts implements UseCase<List<Cart>, NoParams> {
  final CartRepository repository;

  GetAllCarts(this.repository);

  @override
  Future<Either<Failure, List<Cart>>> call(NoParams params) {
    return repository.getAllCarts();
  }
}