import 'package:chic_lyne/features/fliter_view/data/models/result_model.dart';

abstract class SortByState {
  const SortByState();
}

class SortByInitial extends SortByState {
  const SortByInitial();
}

class SortByLoading extends SortByState {
  const SortByLoading();
}

class SortByLoaded extends SortByState {
  final ResultSortByModel result;

  const SortByLoaded(this.result);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortByLoaded &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;
}

class SortByError extends SortByState {
  final String message;

  const SortByError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortByError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}