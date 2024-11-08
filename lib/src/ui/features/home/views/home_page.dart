import 'package:flutter/material.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// The name of the route.
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
