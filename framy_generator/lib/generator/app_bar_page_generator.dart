String generateAppBarPage() => '''
class FramyAppBarPage extends StatelessWidget {
  const FramyAppBarPage() : super(key: const Key('FramyAppBarPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppBar(
            title: Text('AppBar'),
          ),
        ],
      ),
    );
  }
}
''';
