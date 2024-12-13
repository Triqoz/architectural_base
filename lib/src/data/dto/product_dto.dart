import '../../core/entities/entities.dart';

class ProductDto {
  ProductDto({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final double price;

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductDto.fromEntity(Product entity) {
    return ProductDto(
      id: entity.id,
      name: entity.name,
      price: entity.price,
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      price: price,
    );
  }
}
