String generateWidgetListDependencyInput() => '''
class FramyWidgetListDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetListDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            if (dependency.value == null) {
              dependency.value = [null];
            } else {
              dependency.value.add(null);
            }
            onChanged(dependency);
          },
        ),
      ],
    );
  }
}
''';
