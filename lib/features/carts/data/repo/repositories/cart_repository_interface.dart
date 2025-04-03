import 'package:chic_lyne/core/error/failures.dart';
import 'package:chic_lyne/features/carts/domain/entities/cart.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  // Basic cart operations
  Future<Either<Failure, List<Cart>>> getAllCarts();
  Future<Either<Failure, Cart>> getCartById(int cartId);
  Future<Either<Failure, Cart>> getCartByUser(int userId);
  Future<Either<Failure, Cart>> addCart(Map<String, dynamic> cartData);
  Future<Either<Failure, Cart>> updateCart(int cartId, Map<String, dynamic> updateData);
  Future<Either<Failure, bool>> deleteCart(int cartId);

  // Product operations within cart
  Future<Either<Failure, Cart>> addProductToCart(int cartId, Map<String, dynamic> product);
  Future<Either<Failure, Cart>> removeProductFromCart(int cartId, int productId);
  Future<Either<Failure, Cart>> incrementProductQuantity(int cartId, int productId);
  Future<Either<Failure, Cart>> decrementProductQuantity(int cartId, int productId);
  Future<Either<Failure, Cart>> clearCart(int cartId);
}