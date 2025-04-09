import 'package:chic_lyne/features/search_view/data/api/search_api_service.dart';
import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:chic_lyne/features/search_view/data/models/search_query_params.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  final SearchApiService _searchApiService;

  SearchRepository(this._searchApiService);

  Future<SearchProductResponseModel> searchProducts(SearchQueryParams params) async {
    try {
      final response = await _searchApiService.searchProducts(params);
      return response;
    } on DioException catch (e) {
      // يمكنك التعامل مع أخطاء Dio هنا، مثل تسجيل الأخطاء أو إرجاع رسالة خطأ مخصصة
      throw Exception('Failed to search products: ${e.message}');
    }
  }
}