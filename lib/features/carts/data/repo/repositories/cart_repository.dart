import 'package:chic_lyne/core/error/exception.dart';
import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/features/carts/data/datasources/cart_remote_datasource.dart';
import 'package:chic_lyne/features/carts/data/repo/repositories/cart_repository_interface.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Cart>>> getAllCarts() async {
    try {
      final carts = await remoteDataSource.getAllCarts();
      return Right(carts.cast<Cart>());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCartById(int cartId) async {
    try {
      final cart = await remoteDataSource.getCartById(cartId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCartByUser(int userId) async {
    try {
      final cart = await remoteDataSource.getCartByUser(userId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addCart(Map<String, dynamic> cartData) async {
    try {
      final cart = await remoteDataSource.addCart(cartData);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateCart(int cartId, Map<String, dynamic> updateData) async {
    try {
      final cart = await remoteDataSource.updateCart(cartId, updateData);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCart(int cartId) async {
    try {
      final result = await remoteDataSource.deleteCart(cartId);
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addProductToCart(int cartId, Map<String, dynamic> product) async {
    try {
      final cart = await remoteDataSource.addProductToCart(cartId, product);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeProductFromCart(int cartId, int productId) async {
    try {
      final cart = await remoteDataSource.removeProductFromCart(cartId, productId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> incrementProductQuantity(int cartId, int productId) async {
    try {
      final cart = await remoteDataSource.incrementProductQuantity(cartId, productId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> decrementProductQuantity(int cartId, int productId) async {
    try {
      final cart = await remoteDataSource.decrementProductQuantity(cartId, productId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> clearCart(int cartId) async {
    try {
      final cart = await remoteDataSource.clearCart(cartId);
      return Right(cart as Cart);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}