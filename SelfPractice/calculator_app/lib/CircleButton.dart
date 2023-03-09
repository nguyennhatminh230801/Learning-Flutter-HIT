import 'package:flutter/material.dart';

class ButtonCircle extends StatefulWidget {
  final String buttonContent;
  final Color buttonColor;
  final Function(String) clickEvent;
  const ButtonCircle({Key? key, required this.buttonContent, required this.buttonColor, required this.clickEvent}) : super(key: key);

  @override
  State<ButtonCircle> createState() => _ButtonCircleState();
}

class _ButtonCircleState extends State<ButtonCircle> {
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
              minimumSize: Size(80, 80)
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