import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';

class TestMaterialApp extends StatelessWidget {
  final Widget child;

  const TestMaterialApp(this.child);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      home: child,
    );
  }
}
