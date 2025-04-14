import 'package:chic_lyne/features/top_selling/data/datasources/models/top_selling_remote_data_source.dart';

import '../../domain/repositories/top_selling_repository.dart';
import '../../domain/entities/top_selling_product.dart';
import '../models/top_selling_product_model.dart';

class TopSellingRepositoryImpl implements TopSellingRepository {
  final TopSellingRemoteDataSource remoteDataSource;

  TopSellingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TopSellingProduct>> getTopSellingProducts({int limit = 5}) async {
    final models = await remoteDataSource.getTopSellingProducts(limit: limit);
    return models.map(_mapModelToEntity).toList();
  }

  TopSellingProduct _mapModelToEntity(TopSellingProductModel model) {
    return TopSellingProduct(
      id: model.id,
      title: model.title,
      price: model.price,
      discountPercentage: model.discountPercentage,
      rating: model.rating,
      stock: model.stock,
      thumbnail: model.thumbnail,
    );
  }
}