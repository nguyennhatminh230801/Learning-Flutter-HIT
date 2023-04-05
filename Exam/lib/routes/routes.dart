import 'package:exam_flutter/screen/addtask/addtask.dart';
import 'package:exam_flutter/screen/board/boards.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const BoardsScreen());
      case '/add_task':
        return MaterialPageRoute(builder: (context) => const AddTaskScreen());
      default:
        return MaterialPageRoute(builder: (context) => const BoardsScreen());
    }
  }
}