import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_buoi_3/math/math_screen.dart';
import 'package:learning_buoi_3/math/start_screen.dart';
import 'package:learning_buoi_3/constant/constant.dart' as constant;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: constant.appTitle,
      initialRoute: constant.firstPageDirection,
      routes: {
        constant.firstPageDirection: (context) => const StartScreen(),
        constant.mathPageDirection: (context) => const MathScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

