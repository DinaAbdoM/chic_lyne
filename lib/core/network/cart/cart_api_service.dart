// // import 'package:retrofit/retrofit.dart';
// // import 'package:dio/dio.dart';
// // import '../models/cart_item.dart';

// // part 'cart_api_service.g.dart';

// // @RestApi(baseUrl: "https://dummyjson.com/")
// // abstract class CartApiService {
// //   factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

// //   @GET("carts")
// //   Future<CartResponse> getCarts({
// //     @Query('limit') int? limit,
// //     @Query('skip') int? skip,
// //   });

// //   @GET("carts/{id}")
// //   Future<CartModel> getCart(@Path('id') int id);

// //   @GET("carts/user/{userId}")
// //   Future<CartModel> getUserCart(@Path('userId') int userId);

// //   @POST("carts/add")
// // Future<CartModel> createCart({
// //   @Body() required int userId,
// //   @Body() required List<CartProduct> products,
// // });

// // @POST("carts/{cartId}/products")
// // Future<CartModel> addProduct({
// //   @Path() required int cartId,
// //   @Body() required Map<String, dynamic> product,
// // });
// //   @PUT("carts/{id}")
// //   Future<CartModel> updateCart(
// //     @Path('id') int id,
// //     @Body() CartModel cart,
// //   );

// //   @DELETE("carts/{id}")
// //   Future<CartModel> deleteCart(@Path('id') int id);

// //   @POST("carts/remove")
// //   Future<CartModel> removeProductFromCart(@Body() CartProduct product);

// //   @POST("carts/{id}/clear")
// //   Future<CartModel> clearCart(@Path('id') int id);

// //   @POST("carts/increment")
// //   Future<CartModel> incrementProductQuantity(@Body() CartProduct product);

// //   @POST("carts/decrement")
// //   Future<CartModel> decrementProductQuantity(@Body() CartProduct product);
// // }
// import 'package:chic_lyne/core/constants/app_constants.dart';
// import 'package:chic_lyne/features/carts/data/models/cart_model.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';


// part 'cart_api_service.g.dart';

// @RestApi(baseUrl: AppConstants.baseUrl)
// abstract class CartApiService {
//   // إنشاء singleton للـ Dio
//   factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

//   // GET - جلب كل العربات
//   @GET("/carts")
//   Future<List<CartModel>> getAllCarts();

//   // GET - جلب عربة محددة بواسطة الـ ID
//   @GET("/carts/{id}")
//   Future<CartModel> getCartById(@Path("id") int cartId);

//   // POST - إضافة عربة جديدة
//   @POST("/carts/add")
//   Future<CartModel> addNewCart(
//     @Body() Map<String, dynamic> cartData,
//     @Header("Content-Type") String contentType,
//   );

//   // PUT - تحديث عربة موجودة
//   @PUT("/carts/{id}")
//   Future<CartModel> updateCart(
//     @Path("id") int cartId,
//     @Body() Map<String, dynamic> updateData,
//   );

//   // DELETE - حذف عربة
//   @DELETE("/carts/{id}")
//   Future<Map<String, dynamic>> deleteCart(@Path("id") int cartId);
// }