import 'package:framy_generator/generator/widget_dependency_utils.dart';

import '../framy_object.dart';

String generateTests(
    List<FramyObject> widgetFramyObjects, List<FramyObject> presetObjects) {
  return widgetFramyObjects.fold(
        '''void main() async {\n
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  var fontLoader = FontLoader('Roboto');
  fontLoader.addFont(loadRobotoFont());
  await fontLoader.load();
  (binding.window as TestWindow)
    ..physicalSizeTestValue = Size(414, 896)
    ..devicePixelRatioTestValue = 1.0;
''',
        (previousValue, element) =>
            previousValue + _generateTest(element, presetObjects),
      ) +
      '\n}';
}

String _generateTest(
    FramyObject widgetObject, List<FramyObject> presetObjects) {
  final className = widgetObject.name;

  return '''
 group('$className', () {
    testWidgets('default', (tester) async {
      final dependencies = [${initializeFramyObjectDependencies(widgetObject)}];
      final valueGetter = (String name) => dependencies.singleWhere((d) => d.name == name).value;
      final widget = ${wrapConstructor(widgetObject)};
      await tester.pumpWrappedWidget(widget);
      await expectLater(
        find.byType($className),
        matchesGoldenFile('goldens/${className}_default.png'),
      );
    });
    
    ${_generatePresetTests(widgetObject, presetObjects)}
  });
  
''';
}

String _generatePresetTests(
    FramyObject widgetObject, List<FramyObject> presetObjects) {
  return widgetObject.constructors.first.dependencies.fold(
      '',
      (prev, dep) =>
          prev +
          _generatePresetTestForType(widgetObject, presetObjects, dep.type));
}

String _generatePresetTestForType(
    FramyObject widgetObject, List<FramyObject> presetObjects, String type) {
  if (!presetObjects.any((element) => element.returnType == type)) {
    return '';
  }
  final className = widgetObject.name;

  return '''
   createFramyPresets()['$type']?.forEach((presetName, presetValue) {
      testWidgets(presetName, (tester) async {
        final dependencies = [${initializeFramyObjectDependencies(widgetObject)}];
        dependencies
            .where((dep) => dep.type == '$type')
            .forEach((dep) => dep.value = presetValue);
        final valueGetter = (String name) => dependencies.singleWhere((d) => d.name == name).value;
        final widget = ${wrapConstructor(widgetObject)};
        await tester.pumpWrappedWidget(widget);
        await expectLater(
          find.byType($className),
          matchesGoldenFile('goldens/${className}_\$presetName.png'),
        );
    });
  });
''';
}
