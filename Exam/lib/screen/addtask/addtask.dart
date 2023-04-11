import 'dart:developer';

import 'package:exam_flutter/bloc/addtask/add_task_bloc.dart';
import 'package:exam_flutter/bloc/addtask/add_task_event.dart';
import 'package:exam_flutter/bloc/addtask/add_task_state.dart';
import 'package:exam_flutter/model/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formStateKey = GlobalKey<FormState>();

  final listRemind = const [
    DropdownMenuItem(value: "10 minute early", child: Text("10 minute early")),
    DropdownMenuItem(value: "30 minute early", child: Text("30 minute early")),
    DropdownMenuItem(value: "1 hour early", child: Text("1 hour early")),
  ];

  final listRepeat = const [
    DropdownMenuItem(value: "weekly", child: Text("weekly")),
    DropdownMenuItem(
        value: "monthly",
        child: Text(
          "monthly",
        )),
    DropdownMenuItem(value: "yearly", child: Text("yearly")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          return buildChangeValueLayout(state);
        },
      ),
    );
  }

  Widget buildChangeValueLayout(AddTaskState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text("Add task", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Form(
        key: _formStateKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildInfoColumn(
                  title: "Title",
                  widget: Builder(builder: (context) {
                    return TextFormField(
                      validator: (value) {
                        if(state is AddTaskSubmittedFormFailureState){
                          return state.addTaskValidator.titleValidator;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (title) => context.read<AddTaskBloc>().add(
                          AddTaskChangedValueEvent(context
                              .read<AddTaskBloc>()
                              .currentTask
                              .copyWith(title: title))),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Design team meeting',
                      ),
                    );
                  })),
              buildInfoColumn(
                  title: "Deadline",
                  widget: Builder(builder: (context) {
                    return TextFormField(
                      validator: (value) {
                        if(state is AddTaskSubmittedFormFailureState){
                          return state.addTaskValidator.deadlineValidator;
                        }
                        return null;
                      },
                        autovalidateMode: AutovalidateMode.always,
                      onChanged: (deadline) => context.read<AddTaskBloc>().add(
                          AddTaskChangedValueEvent(context
                              .read<AddTaskBloc>()
                              .currentTask
                              .copyWith(deadline: deadline))),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '2021-02-08',
                          suffixIcon: Icon(Icons.calendar_month)),
                    );
                  })),
              Row(
                children: [
                  Expanded(
                      child: buildInfoColumn(
                          title: "Start time",
                          widget: Builder(builder: (context) {
                            return TextFormField(
                              validator: (value) {
                                if(state is AddTaskSubmittedFormFailureState){
                                  log("fail submit");
                                  return state.addTaskValidator.startTimeValidator;
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (startTime) => context
                                  .read<AddTaskBloc>()
                                  .add(AddTaskChangedValueEvent(context
                                      .read<AddTaskBloc>()
                                      .currentTask
                                      .copyWith(startTime: startTime))),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '11:00 AM',
                                  suffixIcon: Icon(Icons.alarm)),
                            );
                          }))),
                  Expanded(
                      child: buildInfoColumn(
                          title: "End time",
                          widget: Builder(builder: (context) {
                            return TextFormField(
                              validator: (value) {
                                if(state is AddTaskSubmittedFormFailureState){
                                  return state.addTaskValidator.endTimeValidator;
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (endTime) => context
                                  .read<AddTaskBloc>()
                                  .add(AddTaskChangedValueEvent(context
                                      .read<AddTaskBloc>()
                                      .currentTask
                                      .copyWith(endTime: endTime))),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '14:00 PM',
                                  suffixIcon: Icon(Icons.alarm)),
                            );
                          }))),
                ],
              ),
              buildInfoColumn(
                  title: "Remind",
                  widget: Builder(builder: (context) {
                    return DropdownButton(
                        isExpanded: true,
                        value: context
                                .read<AddTaskBloc>()
                                .currentTask
                                .remindAt
                                .isEmpty
                            ? _updateRemindDefaultValue(context, listRemind.first.value!)
                            : context.read<AddTaskBloc>().currentTask.remindAt,
                        items: listRemind,
                        onChanged: (value) => context.read<AddTaskBloc>().add(
                            AddTaskChangedValueEvent(context
                                .read<AddTaskBloc>()
                                .currentTask
                                .copyWith(remindAt: value as String))));
                  })),
              buildInfoColumn(
                  title: "Repeat",
                  widget: Builder(builder: (context) {
                    return DropdownButton(
                        isExpanded: true,
                        value: context
                                .read<AddTaskBloc>()
                                .currentTask
                                .repeat
                                .isEmpty
                            ? _updateRepeatDefaultValue(context, listRepeat.first.value!)
                            : context.read<AddTaskBloc>().currentTask.repeat,
                        items: listRepeat,
                        onChanged: (value) => context.read<AddTaskBloc>().add(
                            AddTaskChangedValueEvent(context
                                .read<AddTaskBloc>()
                                .currentTask
                                .copyWith(repeat: value as String))));
                  })),
              buildInfoColumn(
                  title: "Colors",
                  widget: Row(
                    children: [
                      buildColors(Colors.red),
                      buildColors(Colors.yellow),
                      buildColors(Colors.green),
                      buildColors(Colors.blue),
                      buildColors(Colors.purple),
                    ],
                  )),
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      context.read<AddTaskBloc>().add(AddTaskSubmittedFormEvent());
                      //Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Text("Create a task",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white))),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  String _updateRemindDefaultValue(BuildContext context, String value) {
    context.read<AddTaskBloc>().add(AddTaskChangedValueEvent(
        context.read<AddTaskBloc>().currentTask.copyWith(remindAt: value)));
    return value;
  }

  String _updateRepeatDefaultValue(BuildContext context, String value) {
    context.read<AddTaskBloc>().add(AddTaskChangedValueEvent(
        context.read<AddTaskBloc>().currentTask.copyWith(repeat: value)));
    return value;
  }

  Widget buildColors(Color color) {
    return Expanded(
      child: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return color;
          }),
          checkColor: Colors.white,
          activeColor: color,
          onChanged: (bool? value) {},
          value: true,
        ),
      ),
    );
  }

  Widget buildInfoColumn({required String title, required Widget widget}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          widget,
        ],
      ),
    );
  }
}
