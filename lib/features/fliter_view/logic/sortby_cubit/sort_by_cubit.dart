import 'package:chic_lyne/features/fliter_view/data/repos/sort_by.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sort_by_state.dart';

class SortByCubit extends Cubit<SortByState> {
  final SortByRepo sortByRepo;

  SortByCubit(this.sortByRepo) : super(const SortByInitial());

  Future<void> getSortBy(String sortBy, String order) async {
    emit(const SortByLoading());
    try {
      final result = await sortByRepo.getSortBy(sortBy, order);
      emit(SortByLoaded(result));
    } catch (e) {
      emit(SortByError(e.toString()));
    }
  }
}