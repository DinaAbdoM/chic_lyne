import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
import 'package:chic_lyne/features/new_in/domain/repositories/product_repository.dart';


class GetNewProductsUseCase {
  final ProductRepository repository;

  GetNewProductsUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.getNewProducts();
  }
}