String generateFramyApp() => '''
class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      home: FramyLayoutTemplate(
        child: FramyFontsPage(),
      ),
    );
  }
}
''';
