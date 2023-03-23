import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_buoi_3/constant/constant.dart';

import '../dialog/result_dialog.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({Key? key}) : super(key: key);

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> with TickerProviderStateMixin {
  late int num1, num2, answer, bias, result;
  late bool isWrongThisQuestion;
  late Color backgroundColor = randomOpaqueColor();
  final random = Random();

  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: gameDuration,
  )
    ..addListener(() {
      setState(() {});
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ResultDialog(result: result);
            });
      }
    });

  @override
  void initState() {
    //Start
    result = 0;
    generateRandomQuestion();
    controller.forward();
    super.initState();
  }

  void generateRandomQuestion() {
      num1 = random.nextInt(200);
      num2 = random.nextInt(200);
      bias = random.nextInt(50);
      isWrongThisQuestion = random.nextBool();

      if (isWrongThisQuestion) {
        answer = num1 + num2 + bias;
      } else {
        answer = num1 + num2;
      }
    ;
  }

  Color randomOpaqueColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: controller.value,
              valueColor: controller
                  .drive(ColorTween(begin: Colors.blue, end: Colors.green)),
              color: Colors.white,
              minHeight: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${gameDuration.inSeconds - (controller.value * gameDuration.inSeconds).toInt()}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "$num1 + $num2",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                Text(
                  "= $answer",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      backgroundColor = randomOpaqueColor();
                      if (!isWrongThisQuestion) {
                        result++;
                      }
                      generateRandomQuestion();
                      setState(() {});
                    },
                    child: const Text(trueBtn),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        backgroundColor = randomOpaqueColor();
                        if (isWrongThisQuestion) {
                          result++;
                        }
                        generateRandomQuestion();
                      });
                      },
                    child: const Text(falseBtn),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


