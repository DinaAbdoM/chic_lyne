import 'package:chic_lyne/core/network/dio_client.dart';
import 'package:chic_lyne/features/top_selling/data/models/top_selling_product_model.dart';
import 'package:dio/dio.dart';

abstract class TopSellingRemoteDataSource {
  Future<List<TopSellingProductModel>> getTopSellingProducts({int limit = 5});
}

class TopSellingRemoteDataSourceImpl implements TopSellingRemoteDataSource {
  final DioClient dioClient;

  TopSellingRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<TopSellingProductModel>> getTopSellingProducts({
    int limit = 5,
  }) async {
    try {
      final response = await dioClient.get(
        '/products',
        queryParameters: {'limit': limit, 'sort': 'rating', 'order': 'desc'},
      );

      // التحقق من وجود البيانات وهيكلها
      if (response.data == null || response.data['products'] == null) {
        throw Exception('No products data found in response');
      }

      // التحقق من أن products هي List
      if (response.data['products'] is! List) {
        throw Exception(
          'Expected List but got ${response.data['products'].runtimeType}',
        );
      }

      // التحويل الآمن مع معالجة الأخطاء لكل عنصر
      final productsList =
          (response.data['products'] as List).map((productJson) {
            try {
              return TopSellingProductModel.fromJson(productJson);
            } catch (e) {
              throw Exception('Failed to parse product: ${e.toString()}');
            }
          }).toList();

      return productsList;
    } on DioException catch (e) {
      throw Exception('API Error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
