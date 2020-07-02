String generateTextFieldPage() => '''
class FramyTextFieldPage extends StatelessWidget {
  const FramyTextFieldPage() : super(key: const Key('FramyTextFieldPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('TextField'),
            const SizedBox(height: 16),
            TextField(),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Filled TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline TextField',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'TextField with prefixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                labelText: 'TextField with suffixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with error message',
                errorText: 'Invalid value',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Disabled TextField',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''';