import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core.dart';
import '../app/app_scaffold.dart';
import '../features/home/views/home_page.dart';
import '../features/settings/view/settings_page.dart';

/// The root navigator key for the main router of the app.
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// The navigator key for the home navigator.
final GlobalKey<NavigatorState> homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'home');

/// The navigator key for the settings navigator.
final GlobalKey<NavigatorState> settingsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');

/// The [GlobalRouter] maintains the main route configuration for the app.
///
/// Routes that are `fullScreenDialogs` should also set `_rootNavigatorKey` as
/// the `parentNavigatorKey` to ensure that the dialog is displayed correctly.
class CustomRouter {
  static CustomRouter? _singleton;
  GoRouter? _routerInstance;

  /// The router with the routes of pages that should be displayed
  /// within the app scaffold shell.
  GoRouter get router => _routerInstance ??= GoRouter(
        initialLocation: '/home',
        navigatorKey: rootNavigatorKey,
        routes: <RouteBase>[
          StatefulShellRoute.indexedStack(
            builder: (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return _wrapWithBanner(
                child: AppScaffold(navigationShell: navigationShell),
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                navigatorKey: homeNavigatorKey,
                routes: <GoRoute>[
                  GoRoute(
                    name: HomePage.routeName,
                    path: '/home',
                    builder: (BuildContext context, GoRouterState state) {
                      return const HomePage();
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: settingsNavigatorKey,
                routes: <GoRoute>[
                  GoRoute(
                    name: SettingsPage.routeName,
                    path: '/settings',
                    builder: (BuildContext context, GoRouterState state) {
                      return const SettingsPage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  CustomRouter._();

  /// The singleton instance of the [CustomRouter].
  factory CustomRouter() {
    return _singleton ??= CustomRouter._();
  }

  Widget _wrapWithBanner({
    required Widget child,
  }) {
    return switch (ApplicationSettings.environment) {
      Environments.development => Banner(
          location: BannerLocation.topEnd,
          message: 'dev',
          child: child,
        ),
      Environments.staging => Banner(
          location: BannerLocation.topEnd,
          message: 'staging',
          child: child,
        ),
      _ => child,
    };
  }
}
