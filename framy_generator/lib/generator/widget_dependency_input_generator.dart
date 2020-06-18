import 'package:framy_generator/framy_object.dart';

String generateWidgetDependencyInput(List<FramyObject> models) => '''
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
        if (dependency.type == 'bool')
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
        else if (dependency.type == 'String' ||
            dependency.type == 'int' ||
            dependency.type == 'double')
          TextFormField(
            key: inputKey,
            initialValue: dependency.value?.toString(),
            autovalidate: true,
            validator: (value) {
              String error;
              if (dependency.type == 'int') {
                if (int.tryParse(value) == null) {
                  error = 'Invalid integer value';
                }
              } else if (dependency.type == 'double') {
                if (double.tryParse(value) == null) {
                  error = 'Invalid double value';
                }
              }
              return error;
            },
            onChanged: (s) {
              var valueToReturn;
              if (dependency.type == 'int') {
                valueToReturn = int.tryParse(s);
              } else if (dependency.type == 'double') {
                valueToReturn = double.tryParse(s);
              } else {
                valueToReturn = s;
              }
              if (valueToReturn != null) {
                onChanged(dependency.name, valueToReturn);
              }
            },
          )
        ${_generateModelInputs(models)}
        else
          Text('Not supported type')
      ],
    );
  }
}

class FramyModelInput extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<List<FramyDependencyModel>> onChanged;

  FramyModelInput({Key key, this.onChanged, this.dependencies})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: dependencies
            .map((dep) => FramyWidgetDependencyInput(
                  dependency: dep,
                  onChanged: (name, value) {
                    dependency(name).value = value;
                    onChanged(dependencies);
                  },
                ))
            .toList(),
      ),
    );
  }
}
''';

String _generateModelInputs(List<FramyObject> models) {
  return models.fold(
      '', (previousValue, model) => previousValue + _generateModelInput(model));
}

String _generateModelInput(FramyObject model) {
  final constructor = '''${model.name}(
  ${model.widgetDependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))}
  )''';

  return '''
  else if (dependency.type == '${model.name}')
    FramyModelInput(
      dependencies: dependency.subDependencies,
      onChanged: (dependencies) => onChanged(
        dependency.name,
        $constructor,
      ),
    )
    ''';
}

String _generateParamUsageInConstructor(FramyWidgetDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}dependencies.singleWhere((d) => d.name == \'${dependency.name}\').value,\n';
}
