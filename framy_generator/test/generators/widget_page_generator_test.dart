import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Widget page generator result', () {
    test('should not generate anything when no widgets passed', () {
      final result = generateWidgetPages([], []);
      expect(result, isEmpty);
    });

    group('when a widget is passed', () {
      //given
      final widgetObjects = [
        FramyObject()
          ..name = 'MyWidget'
          ..type = FramyObjectType.widget
          ..widgetDependencies = []
      ];

      test('should have a class with name FramyXXXCustomPage', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('class FramyMyWidgetCustomPage'), isTrue);
      });

      test('should contain key Framy_XXX_Page', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('Framy_MyWidget_Page'), isTrue);
      });

      test('should contain custom widget XXX constructor', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('MyWidget('), isTrue);
      });

      test('should contain LayoutBuilder', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('LayoutBuilder('), isTrue);
      });

      test('should contain list with dependencies', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(
            result.contains('List<FramyDependencyModel> dependencies'), isTrue);
      });

      test('should contain FramyWidgetDependenciesPanel', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('FramyWidgetDependenciesPanel('), isTrue);
      });

      test('should contain FramyWidgetDependenciesFAB', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(result.contains('FramyWidgetDependenciesFAB('), isTrue);
      });

      test('should have an initialized presets field', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(
          result.contains(
              'final Map<String, Map<String, dynamic>> presets = createFramyPresets();'),
          isTrue,
        );
      });

      test('should contain definition of onChanged method', () {
        final result = generateWidgetPages(widgetObjects, []);
        expect(
          result
              .contains('void onChanged(String name, dynamic dependencyValue)'),
          isTrue,
        );
      });
    });

    test('should contain 2 classes with proper names when 2 widgets are passed',
        () {
      //given
      final widgetObjects = [
        FramyObject()
          ..name = 'Widget1'
          ..type = FramyObjectType.widget
          ..widgetDependencies = [],
        FramyObject()
          ..name = 'Widget2'
          ..type = FramyObjectType.widget
          ..widgetDependencies = [],
      ];
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      expect(result.contains('FramyWidget1CustomPage'), isTrue);
      expect(result.contains('FramyWidget2CustomPage'), isTrue);
    });

    test(
        'should contain initialized dependencies list when widget has dependency',
        () {
      //given
      final widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
        'arg1',
        'String',
        null,
        false,
      ));
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      final expectedList = '''
  List<FramyDependencyModel> dependencies = [
    FramyDependencyModel<String>('arg1', 'String', null, createSubDependencies('String')),''';
      expect(result.contains(expectedList), isTrue);
    });

    test('should properly handle int dependency', () {
      //given
      final widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
        'arg1',
        'int',
        '13',
        false,
      ));
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      final expectedDependency =
          'FramyDependencyModel<int>(\'arg1\', \'int\', 13, createSubDependencies(\'int\')),';
      expect(result.contains(expectedDependency), isTrue);
    });

    test(
        'should use dependency in widget constructor when the non-named dependency is passed',
        () {
      //given
      final widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
        'arg1',
        'String',
        null,
        false,
      ));
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      expect(
        result.contains(RegExp('Widget1\\(\n *dependency\\(\'arg1\'\\).value')),
        isTrue,
      );
    });

    test(
        'should use dependency in widget constructor when the named dependency is passed',
        () {
      //given
      final widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
        'arg1',
        'String',
        null,
        true,
      ));
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      expect(
        result.contains(
            RegExp('Widget1\\(\n *arg1: dependency\\(\'arg1\'\\).value')),
        isTrue,
      );
    });

    test(
        'should use default value in dependency initialization when default value is present',
        () {
      //given
      final widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
        'arg1',
        'String',
        "'fooDefaultValue'",
        false,
      ));
      //when
      final result = generateWidgetPages(widgetObjects, []);
      //then
      expect(
        result.contains(RegExp('FramyDependencyModel.*\'fooDefaultValue\'')),
        isTrue,
      );
    });

    group('when the provider parameter is passed', () {
      List<FramyObject> widgetObjects;

      setUp(() {
        widgetObjects = getFramyObjectWithDependency(FramyWidgetDependency(
          'String',
          'String',
          null,
          false,
          dependencyType: FramyWidgetDependencyType.provider,
        ));
      });

      test('it should contain the generation of the dependency model', () {
        //when
        final result = generateWidgetPages(widgetObjects, []);
        //then
        expect(
          result.contains(
              'FramyDependencyModel<String>(\'String\', \'String\', null, createSubDependencies(\'String\'))'),
          isTrue,
        );
      });

      test('it should contain MultiProvider', () {
        //when
        final result = generateWidgetPages(widgetObjects, []);
        //then
        expect(result.contains('MultiProvider'), isTrue);
      });

      test('it contain a Provider with the proper type using proper dependency',
          () {
        //when
        final result = generateWidgetPages(widgetObjects, []);
        //then
        expect(
          result.contains(
              'Provider<String>.value(value: dependency(\'String\').value),'),
          isTrue,
        );
      });
    });
  });
}

List<FramyObject> getFramyObjectWithDependency(
    FramyWidgetDependency dependency) {
  return [
    FramyObject()
      ..name = 'Widget1'
      ..type = FramyObjectType.widget
      ..widgetDependencies = [dependency]
  ];
}
