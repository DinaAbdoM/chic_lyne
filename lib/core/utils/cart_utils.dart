// import 'package:chic_lyne/features/products/data/models/cart_model.dart';
// import 'package:dio/dio.dart';

// class CartUtils {
//   static Dio createDio() {
//     final dio = Dio(
//       BaseOptions(
//         baseUrl: "https://dummyjson.com/",
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//       ),
//     );

//     return dio;
//   }

//   double calculateSubtotal(List<CartProduct> products) {
//     return products.fold(
//       0,
//       (sum, product) => sum + (product.price * product.quantity),
//     );
//   }

//   double calculateDiscount(List<CartProduct> products) {
//     return products.fold(
//       0,
//       (sum, product) =>
//           sum +
//           (product.price *
//               product.quantity *
//               (product.discountPercentage / 100)),
//     );
//   }

//   double calculateShipping(List<CartProduct> products) {
//     // Basic shipping calculation - you can customize this
//     const baseShipping = 5.0;
//     const perItemShipping = 1.0;
//     return baseShipping + (products.length * perItemShipping);
//   }

//   double calculateTotal(List<CartProduct> products, {double shippingCost = 0}) {
//     return calculateSubtotal(products) -
//         calculateDiscount(products) +
//         shippingCost;
//   }
// }

import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';

class CartUtils {
  // إنشاء Dio مع تكوينات قياسية
  static Dio createDio({String? baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '', // يمكن تمرير رابط الأساسي أو تركه فارغًا
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // إضافة interceptors
    dio.interceptors.addAll([
      // Logger interceptor للتصحيح والتتبع
      // PrettyDioLogger(
      //   requestHeader: true,
      //   requestBody: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   error: true,
      //   compact: true,
      //   maxWidth: 90,
      // ),

      // Interceptor للتوكين (اختياري)
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // يمكنك إضافة التوكين هنا إذا كان موجودًا
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // معالجة الأخطاء بشكل مركزي
          return handler.next(e);
        },
      ),
    ]);

    return dio;
  }

  // دالة إنشاء توكين مؤقت (مثال)
  static String generateTemporaryToken() {
    // يمكنك تطبيق منطق إنشاء توكين مؤقت هنا
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // التحقق من صلاحية الاستجابة
  static bool isValidResponse(Response response) {
    return response.statusCode == 200 || response.statusCode == 201;
  }

  // معالجة الأخطاء بشكل موحد
  static String handleDioError(DioException e) {
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

  // التحقق من وجود منتج في السلة
  static bool isProductInCart(List<Carts> products, int productId) {
    return products.any((product) => product.id == productId);
  }

  // الحصول على منتج من السلة بواسطة الآيدي
  static Carts getProductById(List<Carts> products, int productId) {
    try {
      return products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return Carts();
    }
  }

  // حساب إجمالي التخفيض
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

  // التحقق من وجود مساحة في السلة
  static bool hasproductspace(List<Products> products, int maxCartLimit) {
    return calculateTotalItems(products) < maxCartLimit;
  }

  // فلترة المنتجات حسب فئة معينة
  static List<Productss> filterProductsByCategory(
    List<Productss> products,
    String tags,
  ) {
    return products.where((product) => product.tags == tags).toList();
  }

  // الحصول على أغلى المنتجات
  // static List<Products> getMostExpensiveProducts(List<Products> products, {int limit = 3}) {
  //   var sortedProducts = List.from(products)
  //     ..sort((a, b) => b.price.compareTo(a.price));
  //   return sortedProducts.take(limit).toList();
  // }

  // التحقق من صلاحية المنتج للإضافة للسلة
  static bool isValidProductForCart(dynamic product) {
    return product != null &&
        product.id != null &&
        product.price > 0 &&
        product.quantity > 0;
  }
}
