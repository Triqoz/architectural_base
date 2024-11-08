import 'package:flutter/material.dart';

import '../../../extensions/build_context_extensions.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.l10n.settings_title,
        ),
      ),
    );
  }
}
