import 'package:chic_lyne/core/data/models/filter_query_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_query_params.g.dart';  // The generated file will be named search_query_params.g.dart

@JsonSerializable()
class SearchQueryParams extends FilterQueryParams {
  final String q;

  SearchQueryParams({required this.q , super.sortBy, super.order});

  // A factory method to create a SearchQueryParams instance from a JSON map
  factory SearchQueryParams.fromJson(Map<String, dynamic> json) =>
      _$SearchQueryParamsFromJson(json);

  // A method to convert SearchQueryParams to a JSON map
  @override
  Map<String, dynamic> toJson() => _$SearchQueryParamsToJson(this);


    SearchQueryParams copyWith({
    String? q,
    String? sortBy,
    String? order,
  }) {
    return SearchQueryParams(
      q: q ?? this.q,
      sortBy: sortBy ?? this.sortBy,
      order: order ?? this.order,
    );
  }
}
