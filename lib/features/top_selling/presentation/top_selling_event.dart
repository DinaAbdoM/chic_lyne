import 'package:equatable/equatable.dart';

abstract class TopSellingEvent extends Equatable {
  const TopSellingEvent();

  @override
  List<Object> get props => [];
}

class FetchTopSellingProducts extends TopSellingEvent {
  final int limit;

  const FetchTopSellingProducts({this.limit = 10});

  @override
  List<Object> get props => [limit];
}