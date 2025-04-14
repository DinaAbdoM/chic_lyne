import 'package:chic_lyne/features/top_selling/domain/entities/top_selling_product.dart';
import 'package:equatable/equatable.dart';

enum TopSellingStatus { initial, loading, success, failure }

class TopSellingState extends Equatable {
  final TopSellingStatus status;
  final List<TopSellingProduct> products;
  final String errorMessage;

  const TopSellingState({
    this.status = TopSellingStatus.initial,
    this.products = const [],
    this.errorMessage = '',
  });

  TopSellingState copyWith({
    TopSellingStatus? status,
    List<TopSellingProduct>? products,
    String? errorMessage,
  }) {
    return TopSellingState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, products, errorMessage];
}