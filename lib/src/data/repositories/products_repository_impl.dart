import '../../core/entities/product.dart';
import '../../core/repositories/products_repository.dart';
import '../../core/result/result.dart';
import '../clients/products_client.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsRepositoryImpl({
    required ProductsClient productsClient,
  }) : _productsClient = productsClient;

  final ProductsClient _productsClient;

  @override
  Future<Result<List<Product>>> getProducts() async {
    return _productsClient.getProducts();
  }
}
