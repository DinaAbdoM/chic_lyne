import 'package:bloc/bloc.dart';
import 'package:chic_lyne/core/cubits/filter/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterInitial()) {
    // Initialize with empty selections
    emit(const FilterLoaded({}));
  }

  /// Update the selected item for a specific filter category
  void updateSelectedItem(String categoryId, String itemValue) {
    if (state is FilterLoaded) {
      final currentState = state as FilterLoaded;
      final updatedSelections = Map<String, String>.from(currentState.selectedFilters);
      updatedSelections[categoryId] = itemValue;
      
      emit(FilterLoaded(updatedSelections));
    }
  }
  
  /// Clear the selected item for a specific filter category
  void clearSelectedItem(String categoryId) {
    if (state is FilterLoaded) {
      final currentState = state as FilterLoaded;
      final updatedSelections = Map<String, String>.from(currentState.selectedFilters);
      updatedSelections.remove(categoryId);
      
      emit(FilterLoaded(updatedSelections));
    }
  }
  
  /// Clear all selected filters
  void clearAllFilters() {
    emit(const FilterLoaded({}));
  }
  
  /// Get the selected filter value for a category
  String? getSelectedFilter(String categoryId) {
    if (state is FilterLoaded) {
      return (state as FilterLoaded).selectedFilters[categoryId];
    }
    return null;
  }
  
  /// Check if any filters are active
  bool hasActiveFilters() {
    if (state is FilterLoaded) {
      return (state as FilterLoaded).selectedFilters.isNotEmpty;
    }
    return false;
  }
}
