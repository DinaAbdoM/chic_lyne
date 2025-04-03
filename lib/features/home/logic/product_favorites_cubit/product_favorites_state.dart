import 'package:chic_lyne/features/home/data/models/product_model.dart';

// حالات المنتج المفضلة
abstract class ProductFavoritesState {}

class ProductFavoritesInitial extends ProductFavoritesState {}

class ProductFavoritesLoading extends ProductFavoritesState {}

class ProductFavoritesLoaded extends ProductFavoritesState {
  final ProductScip productScip;

  ProductFavoritesLoaded(this.productScip);
}

class ProductFavoritesError extends ProductFavoritesState {
  final String message;

  ProductFavoritesError(this.message);
}