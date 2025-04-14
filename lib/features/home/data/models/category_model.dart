import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

// @JsonSerializable()
// class Category {
//   String? slug;
//   String? name;
//   String? url;

//   Category({this.slug, this.name, this.url});

//   factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
//   Map<String, dynamic> toJson() => _$CategoryToJson(this);
// }
//
@JsonSerializable()
class Category {
  String? slug;
  String? name;
  String? url;
  String? thumbnail;

  Category({this.slug, this.name, this.url, this.thumbnail});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({String? thumbnail}) {
    return Category(
      slug: slug,
      name: name,
      url: url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
