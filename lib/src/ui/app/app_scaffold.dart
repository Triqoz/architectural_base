import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core.dart';
import '../extensions/build_context_extensions.dart';

/// The [AppScaffold] is the main scaffold for the application.
///
/// It displays the page of the active route within it self and displays a
/// `bottomNavigationBar` to navigate between the pages.
class AppScaffold extends StatelessWidget {
  /// Create a new instance of [AppScaffold]
  const AppScaffold({
    required this.navigationShell,
    super.key,
  });

  /// The navigation shell to use with the bottom navigation bar.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final Widget body = switch (ApplicationSettings.environment) {
      Environments.development => Banner(
          location: BannerLocation.topEnd,
          message: 'dev',
          child: navigationShell,
        ),
      Environments.staging => Banner(
          location: BannerLocation.topEnd,
          message: 'staging',
          child: navigationShell,
        ),
      _ => navigationShell
    };

    return Scaffold(
      key: GlobalKey<ScaffoldMessengerState>(),
      body: body,
      extendBody: true,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.house),
            label: context.l10n.home_title,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: context.l10n.settings_title,
          ),
        ],
      ),
    );
  }
}
