import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/utils.dart';
import 'package:framy_generator/generator/widget_dependency_utils.dart';

String generateStoryBoardPage(List<FramyObject> widgetFramyObjects, List<FramyObject> modelFramyObjects) {
  String gridViewChildren = widgetFramyObjects.fold(
    '',
        (previousValue, element) => previousValue + _generateStoryboardWidgetPage(element),
  );
  return '''
class FramyStoryBoardPage extends StatelessWidget {
  const FramyStoryBoardPage() : super(key: const Key('FramyStoryBoardPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.all(16),
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 2,
      children: [
      $gridViewChildren
      ],
    );
  }
}

class FramyStoryboardCustomPageWithDependencies extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final Widget Function(DependencyValueGetter dependencyValueGetter) builder;

  const FramyStoryboardCustomPageWithDependencies(
      {Key key, this.dependencies, this.builder})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(16),
      ),
      child: builder(dependencyValue),
    );
  }
}
''';
}

String _generateStoryboardWidgetPage(FramyObject framyObject) {
  final constructorDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.constructor)
      .toList();
  final providerDependencies = framyObject.constructors.first.dependencies
      .where((dep) => dep.dependencyType == FramyDependencyType.provider)
      .toList();

  final constructor = '''${framyObject.name}(
  ${constructorDependencies.fold('', (s, dep) => s + generateParamUsageInConstructor(dep))}
  )''';

  return '''
FramyStoryboardCustomPageWithDependencies(
  dependencies: [
    ${framyObject.constructors.first.dependencies.fold('', (s, dep) => s + dependencyInitializationLine(dep))}
  ],
  builder: (DependencyValueGetter valueGetter) {
    return ${wrapConstructorWithProvider(constructor, providerDependencies)};
  },
),
''';
}


