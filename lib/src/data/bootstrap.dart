import 'package:flutter_ioc/flutter_ioc.dart';

import 'clients/clients.dart';
import 'repositories/products_repository_impl.dart';

Future<void> bootstrap() async {
  final IocContainer ioc = IocContainer.container;

  // Register clients
  ioc.registerFactory<ProductsClient>(
    () => ProductsClient(),
  );

  // Register repositories
  ioc.registerFactory<ProductsRepositoryImpl>(
    () => ProductsRepositoryImpl(
      productsClient: ioc.get<ProductsClient>(),
    ),
  );
}
