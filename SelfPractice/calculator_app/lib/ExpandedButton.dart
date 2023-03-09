import 'package:flutter/material.dart';

class ButtonExpanded extends StatefulWidget {
  final String buttonContent;
  final Color buttonColor;
  final Function(String) clickEvent;
  const ButtonExpanded({Key? key, required this.buttonContent, required this.buttonColor, required this.clickEvent}) : super(key: key);

  @override
  State<ButtonExpanded> createState() => _ButtonExpandedState();
}

class _ButtonExpandedState extends State<ButtonExpanded> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: widget.buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
              ),
              minimumSize: const Size(175, 80)
          ),
          onPressed: () {
            widget.clickEvent(widget.buttonContent);
          },
          child: Text(widget.buttonContent, style: const TextStyle(
            fontSize: 25,
          ),),
        ),
      ),
    );
  }
}