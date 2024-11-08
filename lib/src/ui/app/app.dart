import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../navigation/custom_router.dart';
import '../theming/app_theme.dart';
import '../theming/app_theme_impl.dart';

class App extends StatelessWidget {
  const App({super.key});

  static AppTheme applicationTheme = AppThemeImpl();

  @override
  Widget build(BuildContext context) {
    final CustomRouter customRouter = CustomRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: customRouter.router,
      theme: applicationTheme.theme,
    );
  }
}
