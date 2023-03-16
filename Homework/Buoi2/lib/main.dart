import 'package:flutter/material.dart';

import 'firstpage/first_page.dart';
import 'secondpage/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTVN Buổi 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      //home: const FirstPage(),
      home: const SecondPage(),
    );
  }
}

