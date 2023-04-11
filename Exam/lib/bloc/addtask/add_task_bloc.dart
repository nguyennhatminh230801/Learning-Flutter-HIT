import 'package:exam_flutter/bloc/addtask/add_task_event.dart';
import 'package:exam_flutter/bloc/addtask/add_task_state.dart';
import 'package:exam_flutter/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitialState()) {
    on<AddTaskChangedValueEvent>(_onChangeValueEvent);
    on<AddTaskSubmittedFormEvent>(_onProcessSubmittedForm);
  }

  var currentTask = AddTaskInitialState().task;

  void _onChangeValueEvent(AddTaskChangedValueEvent event, Emitter<AddTaskState> emit) async{
    currentTask = currentTask.copyWith(
      title: event.task.title,
      deadline: event.task.deadline,
      startTime: event.task.startTime,
      endTime: event.task.endTime,
      remindAt: event.task.remindAt,
      repeat: event.task.repeat,
      color: event.task.color
    );
    emit(AddTaskChangedValueState(currentTask));
  }

  void _onProcessSubmittedForm(AddTaskSubmittedFormEvent event, Emitter<AddTaskState> emit) async {
    final validator = AddTaskValidator();

    String datePattern = r'[0-9]{4}-[0-9]{2}-[0-9]{2}';
    RegExp dateRegex = RegExp(datePattern);
    String timePattern = r'[0-9]{2}:[0-9]{2}';
    RegExp timeRegex = RegExp(timePattern);

    if(currentTask.title.isEmpty) {
      validator.titleValidator = "Title should not empty";
    }
    if(currentTask.deadline.isEmpty) {
      validator.deadlineValidator = "Deadline should not empty";
    }
    if(currentTask.startTime.isEmpty) {
      validator.startTimeValidator = "Start time should not empty";
    }
    if(currentTask.title.isEmpty) {
      validator.endTimeValidator = "End time should not empty";
    }

    if(!dateRegex.hasMatch(currentTask.deadline)) {
      validator.deadlineValidator = "Deadline data does not match pattern";
    }

    if(!timeRegex.hasMatch(currentTask.startTime)) {
      validator.startTimeValidator = "Start time does not match pattern";
    }

    if(!timeRegex.hasMatch(currentTask.endTime)) {
      validator.endTimeValidator = "End time does not match pattern";
    }

    if(validator.endTimeValidator == null
      && validator.startTimeValidator == null
      && validator.deadlineValidator == null
      && validator.titleValidator == null) {
      emit(AddTaskSubmittedFormSuccessState(currentTask));
    }
    else {
      emit(AddTaskSubmittedFormFailureState(validator));
    }
  }
}