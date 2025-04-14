import '../entities/top_selling_product.dart';

abstract class TopSellingRepository {
  Future<List<TopSellingProduct>> getTopSellingProducts({required int limit});
}
