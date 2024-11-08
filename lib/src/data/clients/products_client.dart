import '../../core/entities/entities.dart';
import '../../core/result/result.dart';

class ProductsClient {
  Future<Result<List<Product>>> getProducts() async {
    return Future<Result<List<Product>>>.value(
      SuccessResult<List<Product>>(
        value: <Product>[
          const Product(id: '1', name: 'Product 1', price: 100),
          const Product(id: '2', name: 'Product 2', price: 200),
          const Product(id: '3', name: 'Product 3', price: 300),
        ],
      ),
    );
  }
}
