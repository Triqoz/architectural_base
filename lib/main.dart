import 'package:flutter_ioc_get_it/flutter_ioc_get_it.dart';

import 'core.dart' as core;
import 'data.dart' as data;
import 'ui.dart' as ui;

void main() async {
  // Initialize the GetIt Ioc Container.
  GetItIocContainer.register();

  await data.bootstrap();
  await core.bootstrap();
  await ui.bootstrap();
}
