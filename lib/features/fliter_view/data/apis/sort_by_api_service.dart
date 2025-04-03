import 'package:chic_lyne/features/fliter_view/data/models/result_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'sort_by_api_service.g.dart';
@RestApi(baseUrl:"https://dummyjson.com")
abstract class SortByApiService {
  factory SortByApiService(Dio dio, {String baseUrl}) = _SortByApiService;
@GET("/products")
  Future<ResultSortByModel> getSortBy(
    @Query("sortBy") String sort,
    @Query("order") String order,
  );
  
}
