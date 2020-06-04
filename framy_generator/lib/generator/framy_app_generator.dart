String generateFramyApp() => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: FramyAppBar(),
        body: FramyFontsPage(),
      ),
    );
  }
}
''';
