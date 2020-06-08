String generateFramyApp() => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      home: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice = constraints.maxWidth < 1000;
          return Scaffold(
            appBar: FramyAppBar(),
            body: FramyFontsPage(),
            drawer: isSmallDevice ? FramyDrawer() : null,
          );
        },
      ),
    );
  }
}
''';
