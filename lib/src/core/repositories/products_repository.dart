import '../entities/product.dart';
import '../result/result.dart';

abstract class ProductsRepository {
  Future<Result<List<Product>>> getProducts();
}
