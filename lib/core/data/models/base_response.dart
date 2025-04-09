import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(createToJson: false)
class BaseResponse {
  final String message;

  BaseResponse({
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}