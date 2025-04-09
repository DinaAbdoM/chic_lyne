// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQueryParams _$SearchQueryParamsFromJson(Map<String, dynamic> json) =>
    SearchQueryParams(
      q: json['q'] as String,
      sortBy: json['sortBy'] as String?,
      order: json['order'] as String?,
    );

Map<String, dynamic> _$SearchQueryParamsToJson(SearchQueryParams instance) =>
    <String, dynamic>{
      'sortBy': instance.sortBy,
      'order': instance.order,
      'q': instance.q,
    };
