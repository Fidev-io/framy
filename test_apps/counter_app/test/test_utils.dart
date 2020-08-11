import 'package:counter_app/main.app.framy.dart';
import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';

class FramyAppWrapper extends StatelessWidget {
  final Widget child;

  const FramyAppWrapper(this.child);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettings(
      wrapWithScaffold: true,
      wrapWithCenter: false,
      wrapWithSafeArea: false,
      showNavigationMenu: true,
      wrapWithDevicePreview: true,
      child: MaterialApp(
        theme: getThemeData(),
        debugShowCheckedModeBanner: false,
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
