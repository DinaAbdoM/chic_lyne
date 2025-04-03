import 'package:chic_lyne/core/error/exception.dart';
import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:dio/dio.dart';

abstract class CartRemoteDataSource {
  
  // العمليات الأساسية للعربات
  Future<List<CartModel>> getAllCarts();
  Future<CartModel> getCartById(int cartId);
  Future<CartModel> getCartByUser(int userId);
  Future<CartModel> addCart(Map<String, dynamic> cartData);
  Future<CartModel> updateCart(int cartId, Map<String, dynamic> updateData);
  Future<bool> deleteCart(int cartId);

  // عمليات المنتجات داخل العربة
  Future<CartModel> addProductToCart(int cartId, Map<String, dynamic> product);
  Future<CartModel> removeProductFromCart(int cartId, int productId);
  Future<CartModel> incrementProductQuantity(int cartId, int productId);
  Future<CartModel> decrementProductQuantity(int cartId, int productId);
  Future<CartModel> clearCart(int cartId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CartModel>> getAllCarts() async {
    try {
      final response = await dio.get('/carts');
      final List<dynamic> cartsData = response.data['carts'];
      return cartsData.map((json) => CartModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to fetch carts');
    }
  }

  @override
  Future<CartModel> getCartById(int cartId) async {
    try {
      final response = await dio.get('/carts/$cartId');
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to fetch cart');
    }
  }

  @override
  Future<CartModel> getCartByUser(int userId) async {
    try {
      final response = await dio.get('/carts/user/$userId');
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to fetch user cart');
    }
  }

  @override
  Future<CartModel> addCart(Map<String, dynamic> cartData) async {
    try {
      final response = await dio.post(
        '/carts/add', 
        data: cartData,
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to add cart');
    }
  }

  @override
  Future<CartModel> updateCart(int cartId, Map<String, dynamic> updateData) async {
    try {
      final response = await dio.put(
        '/carts/$cartId', 
        data: updateData,
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to update cart');
    }
  }

  @override
  Future<bool> deleteCart(int cartId) async {
    try {
      await dio.delete('/carts/$cartId');
      return true;
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to delete cart');
    }
  }

  @override
  Future<CartModel> addProductToCart(int cartId, Map<String, dynamic> product) async {
    try {
      final response = await dio.post(
        '/carts/$cartId/products', 
        data: product,
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to add product to cart');
    }
  }

  @override
  Future<CartModel> removeProductFromCart(int cartId, int productId) async {
    try {
      final response = await dio.post(
        '/carts/remove', 
        data: {'cartId': cartId, 'productId': productId},
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to remove product from cart');
    }
  }

  @override
  Future<CartModel> incrementProductQuantity(int cartId, int productId) async {
    try {
      final response = await dio.post(
        '/carts/increment', 
        data: {'cartId': cartId, 'productId': productId},
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to increment product quantity');
    }
  }

  @override
  Future<CartModel> decrementProductQuantity(int cartId, int productId) async {
    try {
      final response = await dio.post(
        '/carts/decrement', 
        data: {'cartId': cartId, 'productId': productId},
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to decrement product quantity');
    }
  }

  @override
  Future<CartModel> clearCart(int cartId) async {
    try {
      final response = await dio.post(
        '/carts/$cartId/clear',
        options: Options(contentType: Headers.jsonContentType)
      );
      return CartModel.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException(e.message ?? 'Failed to clear cart');
    }
  }
}
