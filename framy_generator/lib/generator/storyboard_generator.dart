import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_dependency_utils.dart';

String generateStoryboardPage(List<FramyObject> widgetFramyObjects,
    List<FramyObject> modelFramyObjects, bool useDevicePreview) {
  final pageFramyObjects = widgetFramyObjects
      .where((element) => element.type == FramyObjectType.page)
      .toList();
  final gridViewChildren = pageFramyObjects.fold(
    '',
    (previousValue, element) =>
        previousValue + _generateStoryboardWidgetPage(element),
  );
  return '''
class FramyStoryboardPage extends StatelessWidget {
  const FramyStoryboardPage() : super(key: const Key('FramyStoryboardPage'));

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
  final String name;
  
  const FramyStoryboardCustomPageWithDependencies(
      {Key key, this.dependencies, this.builder, this.name})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ${_generateSingleFrame(useDevicePreview)},
        ),
        const SizedBox(height: 8),
        Text(name, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
''';
}

String _generateStoryboardWidgetPage(FramyObject framyObject) {
  return '''
FramyStoryboardCustomPageWithDependencies(
  name: '${framyObject.name}',
  dependencies: [
    ${initializeFramyObjectDependencies(framyObject)}
  ],
  builder: (DependencyValueGetter valueGetter) {
    return ${wrapConstructor(framyObject)};
  },
),
''';
}

String _generateSingleFrame(bool useDevicePreview) {
  final simpleFrame = '''Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black54),
    borderRadius: BorderRadius.circular(16),
  ),
  child: builder(dependencyValue),
)''';
  if (useDevicePreview) {
    return '''FramyAppSettings.of(context).wrapWithDevicePreview ? DevicePreview(
  style: DevicePreviewStyle(
    hasFrameShadow: false,
    toolBar: DevicePreviewToolBarStyle.light(),
    background: BoxDecoration(),
  ),
  isToolBarVisible: false,
  areSettingsEnabled: false,
  builder: (_) => builder(dependencyValue),
) : $simpleFrame''';
  } else {
    return simpleFrame;
  }
}
