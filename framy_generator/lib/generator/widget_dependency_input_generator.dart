String generateWidgetDependencyInput() => '''
class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;

  const FramyWidgetDependencyInput({Key key, this.dependency, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_\${dependency.name}_input');
    return Column(
      children: [
        Text(dependency.name),
        if (dependency.type == FramyDependencyType.bool)
          DropdownButton<bool>(
            key: inputKey,
            value: dependency.value,
            onChanged: (val) => onChanged(dependency.name, val),
            items: [
              DropdownMenuItem(
                value: true,
                child: Text('True'),
              ),
              DropdownMenuItem(
                value: false,
                child: Text('False'),
              )
            ],
          )
        else
          TextFormField(
            key: inputKey,
            initialValue: dependency.value?.toString(),
            autovalidate: true,
            validator: (value) {
              String error;
              if (dependency.type == FramyDependencyType.int) {
                if (int.tryParse(value) == null) {
                  error = 'Invalid integer value';
                }
              } else if (dependency.type == FramyDependencyType.double) {
                if (double.tryParse(value) == null) {
                  error = 'Invalid double value';
                }
              }
              return error;
            },
            onChanged: (s) {
              var valueToReturn;
              if (dependency.type == FramyDependencyType.int) {
                valueToReturn = int.tryParse(s);
              } else if (dependency.type == FramyDependencyType.double) {
                valueToReturn = double.tryParse(s);
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
