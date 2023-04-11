import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Task extends Equatable {
  final String title;
  final String deadline;
  final String startTime;
  final String endTime;
  final String remindAt;
  final String repeat;
  final Color color;

  const Task(
      {required this.title,
      required this.deadline,
      required this.startTime,
      required this.endTime,
      required this.remindAt,
      required this.repeat,
      required this.color});

  @override
  List<Object?> get props =>
      [title, deadline, startTime, endTime, remindAt, repeat, color];

  Task copyWith(
      {String? title,
      String? deadline,
      String? startTime,
      String? endTime,
      String? remindAt,
      String? repeat,
      Color? color}) {
    return Task(
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        remindAt: remindAt ?? this.remindAt,
        repeat: repeat ?? this.repeat,
        color: color ?? this.color);
  }
}

class AddTaskValidator extends Equatable {
  String? titleValidator;
  String? deadlineValidator;
  String? startTimeValidator;
  String? endTimeValidator;

  AddTaskValidator();

  AddTaskValidator.newValidatorResult(this.titleValidator,
      this.deadlineValidator, this.startTimeValidator, this.endTimeValidator) : super();

  @override
  List<Object?> get props =>
      [deadlineValidator, startTimeValidator, endTimeValidator];
}
