import 'package:bloc/bloc.dart';
import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:chic_lyne/features/search_view/data/repo/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final SearchRepository _searchRepository;

  SearchProductsCubit(this._searchRepository) : super(SearchInitial());

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final response = await _searchRepository.searchProducts(query);
      emit(SearchLoaded(response.products));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}