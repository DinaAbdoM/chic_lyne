
// part of 'category_cubit.dart';

// abstract class CategoryState {}

// class CategoryInitial extends CategoryState {}

// class CategoryLoading extends CategoryState {}

// class ProductsLoaded extends CategoryState {
//   final ProductScip  productScip ;

//   ProductsLoaded(this.productScip);
// }

// class CategoryError extends CategoryState {
//   final String message;

//   CategoryError(this.message);
// }
part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

class ProductsLoaded extends CategoryState {
  final ProductScip productScip;

  ProductsLoaded(this.productScip);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}