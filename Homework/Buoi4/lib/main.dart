import 'package:flutter/material.dart';
import 'package:homework_buoi_4/routes/routes.dart';
import 'package:homework_buoi_4/util/constant/constant.dart';
import 'package:homework_buoi_4/di/register_locator.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstant.appTitle,
      initialRoute: RouteConstant.categoryScreenPath,
      onGenerateRoute: RouteGenerator.generateRoutes,
      onUnknownRoute: (settings) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(StringConstant.dialogTitle),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(StringConstant.ok)
                    )
                  ],
                )
        );
        return null;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
