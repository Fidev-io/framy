String generateWidgetListDependencyInput() => '''
class FramyWidgetListDependencyInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          child: Text('Add'),
          onPressed: () {},
        ),
      ],
    );
  }
}
''';
