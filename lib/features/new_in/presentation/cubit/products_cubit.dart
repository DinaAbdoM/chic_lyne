import 'package:bloc/bloc.dart';
import 'package:chic_lyne/features/new_in/domain/entities/product_entity.dart';
import 'package:chic_lyne/features/new_in/domain/usecases/get_new_products_usecase.dart';

part 'products_state.dart';

class NweInProductsCubit extends Cubit<ProductsState> {
  final GetNewProductsUseCase getNewProductsUseCase;

  NweInProductsCubit(this.getNewProductsUseCase) : super(ProductsInitial());

  Future<void> loadNewProducts() async {
    emit(ProductsLoading());
    try {
      final products = await getNewProductsUseCase();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}