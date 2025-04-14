import 'package:chic_lyne/features/new_in/data/services/product_service.dart';
import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';

abstract class ProductRepository {
 

  Future<List<ProductEntity>> getNewProducts();
}
