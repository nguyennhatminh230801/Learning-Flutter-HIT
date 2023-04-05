import 'package:flutter/material.dart';

class BoardsScreen extends StatefulWidget {
  const BoardsScreen({Key? key}) : super(key: key);

  @override
  State<BoardsScreen> createState() => _BoardsScreenState();
}

class _BoardsScreenState extends State<BoardsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Builder(builder: (context) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text("Board",
                    style: Theme.of(context).textTheme.headlineMedium),
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.search, size: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.alarm, size: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(Icons.calendar_month, size: 30),
                  ),
                ],
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text("All"),
                    ),
                    Tab(
                      child: Text("Uncompleted"),
                    ),
                    Tab(
                      child: Text("Completed"),
                    ),
                    Tab(
                      child: Text("Favorite"),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.menu, size: 100),
                              Text("No task yey, Please Insert Some Task")
                            ],
                          )
                        ),
                        Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.menu, size: 100),
                                Text("No task yey, Please Insert Some Task")
                              ],
                            )
                        ),
                        Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.menu, size: 100),
                                Text("No task yey, Please Insert Some Task")
                              ],
                            )
                        ),
                        Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.menu, size: 100),
                                Text("No task yey, Please Insert Some Task")
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      var currentIndex = DefaultTabController.of(context).index;
                      Navigator.of(context)
                          .pushNamed('/add_task', arguments: currentIndex);
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
                            child: Text("Add a task",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white))),
                      ),
                    ),
                  )
                ],
              ));
        }));
  }
}
