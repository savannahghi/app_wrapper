import 'package:flutter/material.dart';

void main() {
  runApp(const AppWrapperExample());
}

class AppWrapperExample extends StatefulWidget {
  /// This widget is the root of your application.
  const AppWrapperExample({Key? key}) : super(key: key);

  @override
  _AppWrapperExampleState createState() => _AppWrapperExampleState();
}

class _AppWrapperExampleState extends State<AppWrapperExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      /// This call to setState tells the Flutter framework that something has
      /// changed in this State, which causes it to rerun the build method below
      /// so that the display can reflect the updated values. If we changed
      /// _counter without calling setState(), then the build method would not be
      /// called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Logger example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
