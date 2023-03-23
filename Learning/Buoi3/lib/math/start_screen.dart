import 'package:flutter/material.dart';
import 'package:learning_buoi_3/constant/constant.dart' as constant;
class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const Padding(
               padding: EdgeInsets.all(30.0),
               child: Text(constant.appTitle,
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
             ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 150,
                height: 50,
                child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: (){
                        Navigator.of(context).pushNamed(constant.mathPageDirection);
                    },
                    child: const Text(constant.start,
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
