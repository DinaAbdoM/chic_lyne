import 'package:chic_lyne/features/home/data/models/category_model.dart';
import 'package:chic_lyne/features/home/data/models/product_model.dart';
import 'package:chic_lyne/features/home/data/repos/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository _repository;

  CategoryCubit(this._repository) : super(CategoryInitial());

  void fetchCategories() async {
    if (isClosed) return;
    emit(CategoryLoading());
    try {
      final categories = await _repository.getCategories();
      final categoriesWithThumbnails = await Future.wait(
        categories.map((category) async {
          final thumbnail = await _repository
              .getRandomThumbnailFromCategory(category.slug ?? '');
          return category.copyWith(thumbnail: thumbnail);
        }).toList(),
      );
      if (!isClosed) emit(CategoriesLoaded(categoriesWithThumbnails));
    } catch (e) {
      if (!isClosed) emit(CategoryError(e.toString()));
    }
  }

  void fetchProductsByCategory(String slug) async {
    if (isClosed) return;
    emit(CategoryLoading());
    try {
      final products = await _repository.getProductsByCategory(slug);
      if (!isClosed) emit(ProductsLoaded(products));
    } catch (e) {
      if (!isClosed) emit(CategoryError(e.toString()));
    }
  }
}
