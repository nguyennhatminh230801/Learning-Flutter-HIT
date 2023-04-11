

import 'package:equatable/equatable.dart';
import 'package:exam_flutter/model/task.dart';
import 'package:flutter/material.dart';

abstract class AddTaskState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddTaskInitialState extends AddTaskState{
  Task task = const Task(title: "", deadline: "", startTime: "", endTime: "", remindAt: "", repeat: "", color: Colors.white);
}

class AddTaskChangedValueState extends AddTaskState{
  final Task task;

  AddTaskChangedValueState(this.task);
  @override
  List<Object?> get props => [task];
}

class AddTaskSubmittedFormSuccessState extends AddTaskState {
  final Task task;

  AddTaskSubmittedFormSuccessState(this.task);
  @override
  List<Object?> get props => [task];

}

class AddTaskSubmittedFormFailureState extends AddTaskState {
  final AddTaskValidator addTaskValidator;

  AddTaskSubmittedFormFailureState(this.addTaskValidator);

  @override
  List<Object?> get props => [addTaskValidator];
}