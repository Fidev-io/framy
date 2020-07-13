import 'package:flutter/material.dart';
import 'package:weight_tracker/app_theme.dart';
import 'package:weight_tracker/main.app.framy.dart';

class FramyAppWrapper extends StatelessWidget {
  final Widget child;

  const FramyAppWrapper(this.child);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettings(
      wrapWithScaffold: true,
      wrapWithSafeArea: false,
      wrapWithCenter: false,
      showNavigationMenu: true,
      child: MaterialApp(
        theme: AppTheme.themeData,
        home: child,
      ),
    );
  }
}

class FramyAppWrapperWithScaffold extends StatelessWidget {
  final Widget child;

  const FramyAppWrapperWithScaffold(this.child);

  @override
  Widget build(BuildContext context) {
    return FramyAppWrapper(
      Scaffold(
        body: child,
      ),
    );
  }
}
