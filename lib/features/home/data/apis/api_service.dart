// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:safecart/features/fliter_view/ui/widgets/fliter_views.dart';
// import 'package:safecart/features/home/scip/models/product_model.dart';

// part 'api_service.g.dart';

// @RestApi(baseUrl: "https://dummyjson.com/products/")
// abstract class ApiServiceScip {
//   factory ApiServiceScip(Dio dio) = _ApiServiceScip;

//   @GET("category/{slug}")
//   Future<ProductScip> getProductsByCategory(@Path("data") String data);
// }
import 'package:chic_lyne/core/constants/app_constants.dart';
import 'package:chic_lyne/features/home/data/models/category_model.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part "api_service.g.dart";


@RestApi(baseUrl: "${AppConstants.baseUrl}/products/")
abstract class ApiServiceScip {
  factory ApiServiceScip(Dio dio) = _ApiServiceScip;

  @GET("categories")
  Future<List<Category>> getCategories();

  @GET("category/{slug}")
  Future<ProductScip> getProductsByCategory(@Path("slug") String slug);

  @GET("category/{slug}")
  Future<ProductScip> getRandomProductFromCategory(@Path("slug") String slug);
}