import 'package:flutter/material.dart';

import 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  /// The name of the route.
  static const String routeName = 'Settings';

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}
