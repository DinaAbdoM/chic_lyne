import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'new_in_product_model.g.dart';

@JsonSerializable()
class NewInProductModel extends ProductEntity {
  const NewInProductModel({
    required super.id,
    required super.title,
    super.description,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.brand,
    required super.category,
    super.thumbnail,
    super.images,
  });

  factory NewInProductModel.fromJson(Map<String, dynamic> json) =>
      _$NewInProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewInProductModelToJson(this);
}
