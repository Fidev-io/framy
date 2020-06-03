String generateAppBar() => '''class FramyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
    );
  }
}
''';
