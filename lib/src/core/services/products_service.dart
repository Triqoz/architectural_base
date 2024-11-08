import '../entities/product.dart';
import '../repositories/products_repository.dart';
import '../result/result.dart';

class ProductsService {
  const ProductsService({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  final ProductsRepository _productsRepository;

  Future<Result<List<Product>>> getProducts() async {
    return _productsRepository.getProducts();
  }
}
