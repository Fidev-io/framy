import 'package:framy_generator/framy_object.dart';

String generateWidgetDependencyInput(List<FramyObject> models) => '''
InputDecoration get _framyInputDecoration => InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
    
class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final Widget trailing;
  
  const FramyWidgetDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets, this.trailing})
      : super(key: key);

  void _onValueChanged(dynamic value) {
    if (value != null && !isValueAPreset(presets, dependency.type, value)) {
      dependency.lastCustomValue = value;
    }
    onChanged(dependency.name, value);
  }
  
  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_\${dependency.name}_input');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dependency.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  if (trailing != null) trailing,
                ],
              ),
              FramyPresetDropdown(
                dependency: dependency,
                onChanged: _onValueChanged,
                presets: presets,
              ),
            ],
          ),
        ),
        if (!isDependencyAPreset(presets, dependency))
          if (dependency.type == 'bool')
             InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<bool>(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
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
                ),
              ),
            )
          else if (dependency.type == 'String' ||
              dependency.type == 'int' ||
              dependency.type == 'double')
            TextFormField(
              key: inputKey,
              decoration: _framyInputDecoration,
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
                  _onValueChanged(valueToReturn);
                }
              },
            )
          else if (dependency.type == 'DateTime')
            FramyDateTimeDependencyInput(
              key: inputKey,
              dependency: dependency,
              presets: presets,
              onChanged: _onValueChanged,
            )
          ${_generateModelInputs(models)}
          else if (dependency.type.startsWith('List<'))
            FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (_) => _onValueChanged(dependency.value),
              presets: presets,
            )
          else if (framyEnumMap.containsKey(dependency.type))
            InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
                  items: framyEnumMap[dependency.type]
                      .map((enumValue) => DropdownMenuItem(
                            value: enumValue,
                            child: Text(enumValue
                                .toString()
                                .substring(enumValue.toString().indexOf('.') + 1)),
                          ))
                      .toList(),
                ),
              ),
            )
          else
            Text('Not supported type'),
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
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: dependencies
            .map((dep) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 2),
                      child: Text('•'),
                    ),
                    Expanded(
                      child: FramyWidgetDependencyInput(
                        dependency: dep,
                        presets: presets,
                        onChanged: (name, value) {
                          dependency(name).value = value;
                          onChanged(dependencies);
                        },
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
''';

String _generateModelInputs(List<FramyObject> modelObjects) {
  final models = modelObjects
      .where((element) => element.type == FramyObjectType.model)
      .toList();
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
      key: inputKey,
      dependencies: dependency.subDependencies,
      presets: presets,
      onChanged: (_) => _onValueChanged(
        framyModelConstructorMap[dependency.type]?.call(dependency),
      ),
    )
''';
    return modelElse;
  }
}
