import 'package:flutter_ioc/flutter_ioc.dart';

import 'clients/clients.dart';
import 'repositories/products_repository_impl.dart';

/// Bootstraps the `data` layer.
///
/// Clients and repository implementations are registered here along with any
/// providers. The `core` layer is bootstrapped after the `data` layer, so the
/// repositories are available for injection into the services.
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
