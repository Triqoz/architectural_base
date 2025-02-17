import '../../core/entities/entities.dart';
import '../../core/result/result.dart';

class ProductsClient {
  Future<Result<List<Product>>> getProducts() async {
    return Future<Result<List<Product>>>.value(
      SuccessResult<List<Product>>.createWithValue(
        <Product>[
          const Product(id: '1', name: 'Product 1'),
          const Product(id: '2', name: 'Product 2'),
          const Product(id: '3', name: 'Product 3'),
        ],
      ),
    );
  }
}
