import 'package:framy_generator/framy_object.dart';

String generateWidgetDependencyInput(List<FramyObject> models) => '''
class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_\${dependency.name}_input');
    final chosenPreset = presets[dependency.type]?.values?.firstWhere(
          (el) => el == dependency.value,
          orElse: () => null,
        );
    return Column(
      children: [
        Text(dependency.name),
        if (presets.containsKey(dependency.type))
          FramyPresetDropdown(
            dependency: dependency,
            chosenPreset: chosenPreset,
            onChanged: onChanged,
            presets: presets,
          ),
        if (chosenPreset == null)
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
  final Map<String, Map<String, dynamic>> presets;

  FramyModelInput({Key key, this.onChanged, this.dependencies, this.presets})
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
                  presets: presets,
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
  if (models.isEmpty) {
    return '';
  } else {
    String modelElse =
        "else if (${models.fold('', (prev, model) => prev + 'dependency.type == \'${model.name}\' || ')})";
    //remove || from last check
    modelElse = modelElse.substring(0, modelElse.length - 5);
    modelElse += ')\n';
    modelElse += '''
    FramyModelInput(
      dependencies: dependency.subDependencies,
      presets: presets,
      onChanged: (_) => onChanged(
        dependency.name,
        framyModelConstructorMap[dependency.type]?.call(dependency),
      ),
    )
''';
    return modelElse;
  }
}
