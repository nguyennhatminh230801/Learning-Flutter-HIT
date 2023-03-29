import 'package:flutter/material.dart';
import 'package:learning_buoi_3/constant/constant.dart' as constant;

class ResultDialog extends StatelessWidget {
  const ResultDialog({
    super.key,
    required this.result,
  });

  final int result;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(constant.resultDialogTitle),
      content: Text("Total result: $result"),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        )
      ],
    );
  }
}