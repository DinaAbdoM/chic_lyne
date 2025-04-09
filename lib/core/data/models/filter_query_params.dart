
import 'package:json_annotation/json_annotation.dart';
part 'filter_query_params.g.dart';
@JsonSerializable(createFactory: false)
class FilterQueryParams {

  final String? sortBy;
  final String? order;

  FilterQueryParams({this.sortBy, this.order});

  Map<String, dynamic> toJson() => _$FilterQueryParamsToJson(this); 
}