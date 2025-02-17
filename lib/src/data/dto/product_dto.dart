import 'package:json_annotation/json_annotation.dart';

import '../../../../../core.dart';

part 'product_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto {
  ProductDto({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDtoFromJson(json);
  }

  factory ProductDto.fromEntity(Product product) {
    return ProductDto(
      id: product.id,
      name: product.name,
    );
  }

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toEntity() {
    return Product(
      id: id,
      name: name,
    );
  }
}
