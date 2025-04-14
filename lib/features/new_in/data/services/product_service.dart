import 'package:chic_lyne/core/network/constants/app_constants.dart';
import 'package:chic_lyne/features/new_in/data/models/new_in_product_model.dart';
import 'package:chic_lyne/features/new_in/data/services/api_service.dart';

class ProductService {
  final ApiService _apiService = ApiService();

  Future<List<NewInProductModel>> getNewProducts() async {
    final data = await _apiService.get(AppConstants.products);
    final products = (data['products'] as List)
        .map((product) => NewInProductModel.fromJson(product))
        .toList();
        
    // Get latest 5 products
    products.sort((a, b) => b.id.compareTo(a.id));
    return products.take(5).toList();
  }
}