import 'package:example/theme.dart';
import 'package:example/user.dart';
import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';

void main() => runApp(MyApp());

@FramyApp()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFab(onPressed: _incrementCounter),
    );
  }
}

void dummyOnPressed() {}

class Temp {
  final int y;

  const Temp([this.y]);
}

@FramyWidget(
  configs: [
    'CustomFab(onPressed: null)',
    'CustomFab(onPressed: dummyOnPressed,)',
    'CustomFab(onPressed: dummyOnPressed, iconData: Icons.people)',
  ],
)
class CustomFab extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const CustomFab(
      {Key key, this.onPressed, User user, this.iconData = Icons.add})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: key,
      onPressed: onPressed,
      tooltip: 'Increment',
      child: Icon(iconData),
    );
  }
}
