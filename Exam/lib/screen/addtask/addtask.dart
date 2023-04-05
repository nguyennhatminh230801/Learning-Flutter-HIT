import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _remindController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text("Add task", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInfoColumn(
                title: "Title",
                widget: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Design team meeting',
                  ),
                )),
            buildInfoColumn(
                title: "Deadline",
                widget: TextField(
                  controller: _deadlineController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '2021-02-08',
                      suffixIcon: Icon(Icons.calendar_month)),
                )),
            Row(
              children: [
                Expanded(
                    child: buildInfoColumn(
                        title: "Start time",
                        widget: TextField(
                          controller: _startTimeController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '11:00 AM',
                              suffixIcon: Icon(Icons.alarm)),
                        ))),
                Expanded(
                    child: buildInfoColumn(
                        title: "End time",
                        widget: TextField(
                          controller: _endTimeController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '14:00 PM',
                              suffixIcon: Icon(Icons.alarm)),
                        ))),
              ],
            ),
            buildInfoColumn(
                title: "Remind",
                widget: SizedBox(
                  child: DropdownButton(
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                            value: "10 minute early",
                            child: Text("10 minute early")),
                        DropdownMenuItem(
                            value: "30 minute early",
                            child: Text("30 minute early")),
                        DropdownMenuItem(
                            value: "1 hour early", child: Text("1 hour early")),
                      ],
                      onChanged: onChangeValue),
                )),
            buildInfoColumn(
                title: "Repeat",
                widget: SizedBox(
                  child: DropdownButton(
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                            value: "weekly", child: Text("weekly")),
                        DropdownMenuItem(
                            value: "monthly",
                            child: Text(
                              "monthly",
                            )),
                        DropdownMenuItem(
                            value: "yearly", child: Text("yearly")),
                      ],
                      onChanged: onChangeValue),
                )),
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
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text("Create a task",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildColors(Color color) {
    return Expanded(
      child: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
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

  void onChangeValue(Object? value) {
    setState(() {});
  }
}
