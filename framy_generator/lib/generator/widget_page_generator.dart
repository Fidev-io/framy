import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';

String generateWidgetPages(
    List<FramyObject> widgetFramyObjects, List<FramyObject> modelFramyObjects) {
  return widgetFramyObjects.fold(
    '',
    (previousValue, element) => previousValue + _generateWidgetPage(element),
  );
}

String _generateWidgetPage(FramyObject framyObject) {
  final constructorDependencies = framyObject.widgetDependencies
      .where(
          (dep) => dep.dependencyType == FramyWidgetDependencyType.constructor)
      .toList();
  final providerDependencies = framyObject.widgetDependencies
      .where((dep) => dep.dependencyType == FramyWidgetDependencyType.provider)
      .toList();

  final constructor = '''${framyObject.name}(
  ${constructorDependencies.fold('', (s, dep) => s + _generateParamUsageInConstructor(dep))}
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
    ${framyObject.widgetDependencies.fold('', (s, dep) => s + dependencyInitializationLine(dep))}
  ];
  final Map<String, Map<String, dynamic>> presets = createFramyPresets();

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);
      
  void onChanged(String name, dynamic dependencyValue) {
    setState(() => dependency(name).value = dependencyValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final body = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ${_wrapConstructorWithProvider(constructor, providerDependencies)},
              ),
              if (!isSmallDevice)
                SizedBox(
                  width: 300,
                  child: FramyWidgetDependenciesPanel(
                    dependencies: dependencies,
                    presets: presets,
                    onChanged: onChanged,
                  ),
                ),
            ],
          );
          if (isSmallDevice) {
            return Scaffold(
              body: body,
              floatingActionButton: FramyWidgetDependenciesFAB(
                dependencies: dependencies,
                presets: presets,
                onChanged: onChanged,
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

String _wrapConstructorWithProvider(
    String constructor, List<FramyWidgetDependency> providerDependencies) {
  if (providerDependencies.isEmpty) {
    return constructor;
  } else {
    return '''
      MultiProvider(
        providers: [
          ${providerDependencies.fold('', (prev, dep) => prev + _providerDependencyToProviderWidget(dep))}
        ],
        child: $constructor,
      )''';
  }
}

String _providerDependencyToProviderWidget(FramyWidgetDependency dependency) =>
    'Provider<${dependency.type}>.value(value: dependency(\'${dependency.name}\').value),\n';

String _generateParamUsageInConstructor(FramyWidgetDependency dependency) {
  final nameInConstructor = dependency.isNamed ? '${dependency.name}: ' : '';
  return '${nameInConstructor}dependency(\'${dependency.name}\').value,\n';
}
