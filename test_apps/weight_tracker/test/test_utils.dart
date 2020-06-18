import 'package:flutter/material.dart';
import 'package:weight_tracker/app_theme.dart';

class TestMaterialApp extends StatelessWidget {
  final Widget child;

  const TestMaterialApp(this.child);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: child,
    );
  }
}

class TestMaterialAppWithScaffold extends StatelessWidget {
  final Widget child;

  const TestMaterialAppWithScaffold(this.child);

  @override
  Widget build(BuildContext context) {
    return TestMaterialApp(
      Scaffold(
        body: child,
      ),
    );
  }
}
