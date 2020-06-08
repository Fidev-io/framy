String generateFramyApp() => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      home: Scaffold(
        appBar: FramyAppBar(),
        body: FramyFontsPage(),
        drawer: FramyDrawer(),
      ),
    );
  }
}
''';
