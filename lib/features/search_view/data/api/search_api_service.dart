import 'package:chic_lyne/core/constants/app_constants.dart';
import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'search_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET("/products/search")
  Future<SearchProductResponseModel> searchProducts(@Query("q") String query);
}