import 'package:flutter/foundation.dart';

abstract class FilterState {
  const FilterState();
}

class FilterInitial extends FilterState {
  const FilterInitial();
}

class FilterLoading extends FilterState {
  const FilterLoading();
}

class FilterLoaded extends FilterState {
  final Map<String, String> selectedFilters;
  
  const FilterLoaded(this.selectedFilters);
  
  FilterLoaded copyWith({Map<String, String>? selectedFilters}) {
    return FilterLoaded(selectedFilters ?? this.selectedFilters);
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FilterLoaded && 
           mapEquals(other.selectedFilters, selectedFilters);
  }
  
  @override
  int get hashCode => selectedFilters.hashCode;
}

class FilterError extends FilterState {
  final String message;
  
  const FilterError(this.message);
}
