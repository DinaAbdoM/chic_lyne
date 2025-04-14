import '../entities/top_selling_product.dart';
import '../repositories/top_selling_repository.dart';

class GetTopSellingProducts {
  final TopSellingRepository repository;

  GetTopSellingProducts({required this.repository});

  Future<List<TopSellingProduct>> call({int limit=5}) async {
    return await repository.getTopSellingProducts(limit:limit);
  }
}