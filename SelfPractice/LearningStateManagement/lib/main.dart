import 'package:flutter/material.dart';
import 'package:learning_state_management/model/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Sử dụng ChangerNotifierProvider để lấy ra một model sử dụng toàn cục
      // tại màn hình này
      home: ChangeNotifierProvider(
          create: (BuildContext context) {
            return CounterModel();
          },
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _counter = 0;
  int get currentCount => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
  
  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Khởi tạo 1 model provider
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.currentCount}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FloatingActionButton(
              onPressed: () => counter.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),

          FloatingActionButton(
              onPressed: () => counter.decrement(),
              child: const Icon(Icons.exposure_minus_1),
          )
        ],
      ),
    );
  }
}
