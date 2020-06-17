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
          autovalidate: true,
          validator: (value) {
            String error;
            if (dependency.type == FramyDependencyType.int) {
              if (int.tryParse(value) == null) {
                error = 'Invalid integer value';
              }
            }
            return error;
          },
          onChanged: (s) {
            var valueToReturn;
            if (dependency.type == FramyDependencyType.int) {
              valueToReturn = int.tryParse(s);
            } else {
              valueToReturn = s;
            }
            if (valueToReturn != null) {
              onChanged(dependency.name, valueToReturn);
            }
          },
        ),
      ],
    );
  }
}
''';
