
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Trang không xác định",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
