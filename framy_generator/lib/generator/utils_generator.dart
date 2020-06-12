String generateUtils() => '''
class FramyHeaderText extends StatelessWidget {
  final String text;

  const FramyHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
''';
