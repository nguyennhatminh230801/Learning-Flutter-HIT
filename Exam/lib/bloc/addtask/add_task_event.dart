
import 'package:equatable/equatable.dart';
import 'package:exam_flutter/model/task.dart';

abstract class AddTaskEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddTaskChangedValueEvent extends AddTaskEvent {
  final Task task;

  AddTaskChangedValueEvent(this.task);
  @override
  List<Object?> get props => [task];
}

class AddTaskSubmittedFormEvent extends AddTaskEvent {}
