
import 'package:chic_lyne/features/new_in/data/services/product_service.dart';
import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
import 'package:chic_lyne/features/new_in/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _productService;

  ProductRepositoryImpl(this._productService);

  @override
  Future<List<ProductEntity>> getNewProducts() async {
    return await _productService.getNewProducts();
  }
}