import 'package:buoi_5/routes/routes.dart';
import 'package:buoi_5/screen/whole_app_widget/UnknownScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoutes,
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const UnknownScreen()),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
    );
  }
}