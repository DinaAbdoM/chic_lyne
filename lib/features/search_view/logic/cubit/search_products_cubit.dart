import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chic_lyne/features/search_view/data/models/search_products_models.dart';
import 'package:chic_lyne/features/search_view/data/models/search_query_params.dart';
import 'package:chic_lyne/features/search_view/data/repo/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'search_products_state.dart';

class SearchProductsCubit extends Cubit<SearchProductsState> {
  final SearchRepository _searchRepository;
  SearchQueryParams? params;

  SearchProductsCubit(this._searchRepository) : super(SearchInitial()) {
    log('Cubit created');
  }

  void setDescending(bool value) {
    params = params?.copyWith(order: value ? 'desc' : 'asc');
    _triggerSearch();
  }

  void setSortBy(String value) {
    params = params?.copyWith(sortBy: value);
    log("message ${params?.sortBy}");
    _triggerSearch();
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    params ??= SearchQueryParams(q: query); // initialize if null
    params = params!.copyWith(q: query); // always update query
    emit(SearchLoading());
    try {
      final response = await _searchRepository.searchProducts(params!);
      log(response.products.toString());
      emit(SearchLoaded(response.products));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _triggerSearch() {
    if (params?.q != null && params!.q.isNotEmpty) {
      searchProducts(params!.q);
    }
  }
}
