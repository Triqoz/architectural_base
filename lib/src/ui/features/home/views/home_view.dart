import 'package:flutter/material.dart';

import '../../../extensions/build_context_extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.l10n.home_title,
        ),
      ),
    );
  }
}
