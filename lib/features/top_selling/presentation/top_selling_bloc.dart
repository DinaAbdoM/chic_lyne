import 'package:bloc/bloc.dart';
import 'package:chic_lyne/features/top_selling/domain/usecases/get_top_selling_products.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_event.dart';
import 'package:chic_lyne/features/top_selling/presentation/top_selling_state.dart';

class TopSellingBloc extends Bloc<TopSellingEvent, TopSellingState> {
  final GetTopSellingProducts getTopSellingProducts;

  TopSellingBloc({required this.getTopSellingProducts})
    : super(const TopSellingState()) {
    on<FetchTopSellingProducts>(_onFetchTopSellingProducts);
  }

  Future<void> _onFetchTopSellingProducts(
    FetchTopSellingProducts event,
    Emitter<TopSellingState> emit,
  ) async {
    try {
      emit(state.copyWith(status: TopSellingStatus.loading));

final result = await getTopSellingProducts.call(limit: event.limit);


      emit(state.copyWith(status: TopSellingStatus.success, products: result));
    } catch (e) {
      emit(
        state.copyWith(
          status: TopSellingStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
