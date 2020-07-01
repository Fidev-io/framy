String generateTogglePage() => '''
class FramyTogglePage extends StatelessWidget {
  const FramyTogglePage() : super(key: const Key('FramyTogglePage'));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const FramyHeaderText('Toggle'),
          ],
        ),
      ),
    );
  }
}
''';