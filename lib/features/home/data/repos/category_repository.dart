// import 'package:safecart/features/home/scip/APi/api_service.dart';
// import 'package:safecart/features/home/scip/models/product_model.dart';

// class CategoryRepository {
//   final ApiServiceScip apiServiceScip;

//   CategoryRepository(this.apiServiceScip);

//   Future<ProductScip> getProductsByCategory(String data) async {
//     return await apiServiceScip.getProductsByCategory(data);
//   }
// }

import 'package:chic_lyne/features/home/data/apis/api_service.dart';
import 'package:chic_lyne/features/home/data/models/category_model.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';

class CategoryRepository {
  final ApiServiceScip _apiService;

  CategoryRepository(this._apiService);

  Future<List<Category>> getCategories() async {
    return await _apiService.getCategories();
  }

  Future<ProductScip> getProductsByCategory(String slug) async {
    return await _apiService.getProductsByCategory(slug);
  }

  Future<String?> getRandomThumbnailFromCategory(String slug) async {
    try {
      final productScip = await _apiService.getRandomProductFromCategory(slug);
      if (productScip.products != null && productScip.products!.isNotEmpty) {
        return productScip.products!.first.thumbnail;
      }
    } catch (e) {
      print("Error fetching random thumbnail: $e");
    }
    return null;
  }
}