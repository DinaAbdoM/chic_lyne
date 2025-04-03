part of 'search_products_cubit.dart';

abstract class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchProductsState {}

class SearchLoading extends SearchProductsState {}

class SearchLoaded extends SearchProductsState {
  final List<Product> products;

  const SearchLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class SearchError extends SearchProductsState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}