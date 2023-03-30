import 'package:buoi_4/ui/testscreen/test_screen.dart';
import 'package:flutter/material.dart';

import '../ui/homepage/my_home_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "Testt"));
      case '/test':
        return MaterialPageRoute(builder: (context) => const TestScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(
            child: Text("Error routes"),
          ),
        ));
    }
  }
}
