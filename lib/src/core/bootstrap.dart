import 'package:flutter_ioc/flutter_ioc.dart';

import 'repositories/products_repository.dart';
import 'services/services.dart';

Future<void> bootstrap() async {
  final IocContainer ioc = IocContainer.container;

  // Register services
  ioc.registerFactory<ProductsService>(
    () => ProductsService(
      productsRepository: ioc.get<ProductsRepository>(),
    ),
  );
}
