String generateWidgetDependencyInput() => '''
class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;

  const FramyWidgetDependencyInput({Key key, this.dependency, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dependency.name),
        TextFormField(
          key: Key('framy_dependency_\${dependency.name}_input'),
          initialValue: dependency.value?.toString(),
          onChanged: (s) {
            var valueToReturn;
            if (dependency.type == FramyDependencyType.int) {
              valueToReturn = int.parse(s);
            } else {
              valueToReturn = s;
            }
            onChanged(dependency.name, valueToReturn);
          },
        ),
      ],
    );
  }
}
''';
