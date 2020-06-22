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
    final String listType = dependency.type.substring(
      dependency.type.indexOf('<') + 1,
      dependency.type.lastIndexOf('>'),
    );
    return Column(
      children: [
        if (dependency.value != null)
          for (int i = 0; i < dependency.value.length; i++)
            FramyWidgetDependencyInput(
              dependency: FramyDependencyModel(
                'List element \${i + 1}',
                listType,
                dependency.value[i],
                [],
              ),
              onChanged: (name, val) {
                dependency.value[i] = val;
                onChanged(dependency);
              },
              presets: presets,
            ),
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
