// import 'package:dio/dio.dart';

// class DioClient {
//   final Dio _dio;

//   DioClient() : _dio = Dio() {
//     _dio.options.baseUrl = 'https://dummyjson.com';
//     _dio.options.connectTimeout = const Duration(seconds: 5);
//     _dio.options.receiveTimeout = const Duration(seconds: 3);
//     _dio.interceptors.add(LogInterceptor(
//       request: true,
//       requestHeader: true,
//       requestBody: true,
//       responseHeader: true,
//       responseBody: true,
//     ));
//   }

//   Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
//     return _dio.get(path, queryParameters: queryParameters);
//   }
  
// }
// dio_client_with_cart_utils.dart

import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_package; 

class DioClient {
  final dio_package.Dio _dio;

 
  static const String _baseUrl = 'https://dummyjson.com';
 static const String products = '$_baseUrl/products';
 
  DioClient() : _dio = dio_package.Dio() {
    // تهيئة خيارات Dio الأساسية
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // إضافة الـ Interceptors لتسجيل الطلبات والأخطاء وإضافة التوكين
    _dio.interceptors.addAll([
      // Logger interceptor (للتصحيح والتتبع أثناء التطوير)
      dio_package.LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
       
      ),

      // Interceptor لإضافة التوكين (يمكن تفعيله وتعديله حسب الحاجة)
      dio_package.InterceptorsWrapper(
        onRequest: (options, handler) {
          // يمكنك إضافة منطق جلب التوكين هنا (من Secure Storage أو غيره)
          // String? token = await getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // معالجة الأخطاء بشكل مركزي باستخدام دالة handleDioError
          final errorMessage = _handleDioError(e);
          // يمكنك هنا تسجيل الخطأ أو عرضه للمستخدم
          return handler.next(e);
        },
      ),
    ]);
  }

  // دالة مساعدة لإجراء طلب GET
  Future<dio_package.Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw 'Unexpected error: ${e.toString()}';
    }
  }

  // دالة مساعدة لإجراء طلب POST
  Future<dio_package.Response> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw 'Unexpected error: ${e.toString()}';
    }
  }

  // دالة مساعدة لإجراء طلب PUT
  Future<dio_package.Response> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw 'Unexpected error: ${e.toString()}';
    }
  }

  // دالة مساعدة لإجراء طلب DELETE
  Future<dio_package.Response> delete(String path, {dynamic data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw 'Unexpected error: ${e.toString()}';
    }
  }

  // دالة إنشاء توكين مؤقت (مثال - يمكن استبدالها بمنطق حقيقي)
  static String generateTemporaryToken() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // التحقق من صلاحية الاستجابة بناءً على رمز الحالة HTTP
  static bool isValidResponse(dio_package.Response response) {
    return response.statusCode == 200 || response.statusCode == 201;
  }

  // معالجة أخطاء Dio بشكل موحد لتبسيط التعامل مع الأخطاء في الطبقات الأخرى
  static String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return 'Bad response: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request canceled';
      case DioExceptionType.unknown:
        return 'Unknown error';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.connectionError:
        return 'Connection error';
    }
  }

  // *** دوال متعلقة بسلة التسوق (Cart Utils) ***

  // حساب السعر الكلي للمنتجات في السلة
  static double calculateTotalPrice(List<Products> products) {
    return products.fold(
      0.0,
      (total, product) => total + (product.price! * product.quantity!),
    );
  }

  // حساب عدد المنتجات في السلة
  static int calculateTotalItems(List<Products> products) {
    return products.fold(0, (total, product) => total + product.quantity!);
  }

  // التحقق من وجود منتج في السلة بناءً على الآيدي
  static bool isProductInCart(List<Carts> carts, int productId) {
    return carts.any((cart) => cart.id == productId);
  }

  // الحصول على منتج من السلة بواسطة الآيدي
  static Carts getProductById(List<Carts> carts, int productId) {
    try {
      return carts.firstWhere((cart) => cart.id == productId);
    } catch (e) {
      return Carts(); // إرجاع كائن Cart فارغ في حالة عدم العثور على المنتج
    }
  }

  // حساب إجمالي التخفيض على المنتجات في السلة
  static double calculateTotalDiscount(List<Products> products) {
    return products.fold(
      0.0,
      (total, product) =>
          total +
          (product.price! *
              product.quantity! *
              (product.discountPercentage! / 100)),
    );
  }

  // التحقق من وجود مساحة في السلة بناءً على الحد الأقصى لعدد العناصر
  static bool hasProductSpace(List<Products> products, int maxCartLimit) {
    return calculateTotalItems(products) < maxCartLimit;
  }

  // فلترة المنتجات حسب فئة معينة (Tags)
  static List<Productss> filterProductsByCategory(
    List<Productss> products,
    String tags,
  ) {
    return products.where((product) => product.tags == tags).toList();
  }

  // التحقق من صلاحية المنتج قبل إضافته إلى السلة
  static bool isValidProductForCart(dynamic product) {
    return product != null &&
        product.id != null &&
        product.price != null &&
        product.price! > 0 &&
        product.quantity != null &&
        product.quantity! > 0;
  }
}