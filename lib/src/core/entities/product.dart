import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
  });

  final String id;

  final String name;

  @override
  List<Object> get props => <Object>[
        id,
        name,
      ];
}
