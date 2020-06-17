import 'package:framy_generator/framy_object.dart';

String generateWidgetPages(List<FramyObject> widgetFramyObjects) {
  return widgetFramyObjects.fold(
    '',
    (previousValue, element) => previousValue + _generateWidgetPage(element),
  );
}

String _generateWidgetPage(FramyObject framyObject) {
  final constructor = '''${framyObject.name}(
  ${framyObject.widgetDependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))}
  )''';
  final className = 'Framy${framyObject.name}CustomPage';
  final stateClassName = '_Framy${framyObject.name}CustomPageState';
  final key = 'Framy_${framyObject.name}_Page';

  return '''
class $className extends StatefulWidget {
  const $className(): super(key: const Key('$key'));

  @override
  $stateClassName createState() => $stateClassName();
}

class $stateClassName extends State<$className> {
  List<FramyDependencyModel> dependencies = [
    ${framyObject.widgetDependencies.fold('', (s, dep) => s + _dependencyInitializationLine(dep))}
  ];

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final dependenciesPanel = FramyWidgetDependenciesPanel(
            dependencies: dependencies,
            onChanged: (name, val) => setState(
              () => dependency(name).value = val,
            ),
          );
          final body = Row(
            children: [
              Expanded(
                child: $constructor,
              ),
              if (!isSmallDevice)
                SizedBox(width: 300, child: dependenciesPanel),
            ],
          );
          if (isSmallDevice) {
            return Scaffold(
              body: body,
              floatingActionButton: FramyWidgetDependenciesFAB(
                dependenciesPanel: dependenciesPanel,
              ),
            );
          } else {
            return body;
          }
        },
      ),
    );
  }
}
''';
}

String _dependencyInitializationLine(FramyWidgetDependency dependency) {
  final String type = 'String';
  final String dependencyType = 'FramyDependencyType.string';
  final String name = dependency.name;
  final String defaultValue = dependency.defaultValue;

  return 'FramyDependencyModel<$type>(\'$name\', $dependencyType, $defaultValue),\n';
}

String _generateParamUsageInConstructor(FramyWidgetDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}dependency(\'${dependency.name}\').value,\n';
}
