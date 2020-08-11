import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/storyboard_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Storyboard generator result', () {
    test('should contain class FramyStoryboardPage', () {
      final result = generateStoryboardPage([], [], false);
      expect(result.contains('class FramyStoryboardPage'), isTrue);
    });

    test('should contain proper key', () {
      final result = generateStoryboardPage([], [], false);
      expect(result.contains('Key(\'FramyStoryboardPage\')'), isTrue);
    });

    test('should contain FramyStoryboardCustomPageWithDependencies definition',
        () {
      final result = generateStoryboardPage([], [], false);
      expect(result.contains('class FramyStoryboardCustomPageWithDependencies'),
          isTrue);
    });

    test('should contain builder(dependencyValue)', () {
      final result = generateStoryboardPage([], [], false);
      expect(result.contains('builder(dependencyValue)'), isTrue);
    });

    test(
        'should contain 3 FramyStoryboardCustomPageWithDependencies when 2 framy objects are passed',
        () {
      //given
      final widgetObjects = [
        FramyObject()
          ..name = 'Widget1'
          ..type = FramyObjectType.page
          ..constructors = [FramyObjectConstructor('', [])],
        FramyObject()
          ..name = 'Widget2'
          ..type = FramyObjectType.page
          ..constructors = [FramyObjectConstructor('', [])],
      ];
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      // then
      // 2 for creating widgets for 2 passed objects and 1 for constructor in class definition
      expect('FramyStoryboardCustomPageWithDependencies('.allMatches(result),
          hasLength(3));
    });

    test(
        'should contain initialized dependencies list when widget has dependency',
        () {
      //given
      final widgetObjects =
          getFramyPageObjectWithDependency(FramyObjectDependency(
        'arg1',
        'String',
        null,
        false,
      ));
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      //then
      final expectedList =
          '''FramyDependencyModel<String>('arg1', 'String', null),''';
      expect(result.contains(expectedList), isTrue);
    });

    test('should properly handle int dependency', () {
      //given
      final widgetObjects =
          getFramyPageObjectWithDependency(FramyObjectDependency(
        'arg1',
        'int',
        '13',
        false,
      ));
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      //then
      final expectedDependency =
          'FramyDependencyModel<int>(\'arg1\', \'int\', 13),';
      expect(result.contains(expectedDependency), isTrue);
    });

    test(
        'should use dependency in widget constructor when the non-named dependency is passed',
        () {
      //given
      final widgetObjects =
          getFramyPageObjectWithDependency(FramyObjectDependency(
        'arg1',
        'String',
        null,
        false,
      ));
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      //then
      expect(
        result.contains(RegExp('Widget1\\(\n *valueGetter\\(\'arg1\'\\)')),
        isTrue,
      );
    });

    test(
        'should use dependency in widget constructor when the named dependency is passed',
        () {
      //given
      final widgetObjects =
          getFramyPageObjectWithDependency(FramyObjectDependency(
        'arg1',
        'String',
        null,
        true,
      ));
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      //then
      expect(
        result
            .contains(RegExp('Widget1\\(\n *arg1: valueGetter\\(\'arg1\'\\)')),
        isTrue,
      );
    });

    test(
        'should use default value in dependency initialization when default value is present',
        () {
      //given
      final widgetObjects =
          getFramyPageObjectWithDependency(FramyObjectDependency(
        'arg1',
        'String',
        "'fooDefaultValue'",
        false,
      ));
      //when
      final result = generateStoryboardPage(widgetObjects, [], false);
      //then
      expect(
        result.contains(RegExp('FramyDependencyModel.*\'fooDefaultValue\'')),
        isTrue,
      );
    });

    group('when the provider parameter is passed', () {
      List<FramyObject> widgetObjects;

      setUp(() {
        widgetObjects = getFramyPageObjectWithDependency(FramyObjectDependency(
          'String',
          'String',
          null,
          false,
          dependencyType: FramyDependencyType.provider,
        ));
      });

      test('it should contain the generation of the dependency model', () {
        //when
        final result = generateStoryboardPage(widgetObjects, [], false);
        //then
        expect(
          result.contains(
              'FramyDependencyModel<String>(\'String\', \'String\', null)'),
          isTrue,
        );
      });

      test('it should contain MultiProvider', () {
        //when
        final result = generateStoryboardPage(widgetObjects, [], false);
        //then
        expect(result.contains('MultiProvider'), isTrue);
      });

      test(
          'it should contain a Provider with the proper type using proper dependency',
          () {
        //when
        final result = generateStoryboardPage(widgetObjects, [], false);
        //then
        expect(
          result.contains(
              'Provider<String>.value(value: valueGetter(\'String\')),'),
          isTrue,
        );
      });
    });

    test('should contain DevicePreview when useDevicePreview is true', () {
      final result = generateStoryboardPage([], [], true);
      expect(result.contains('DevicePreview'), isTrue);
    });

    test('should not contain DevicePreview when useDevicePreview is false', () {
      final result = generateStoryboardPage([], [], false);
      expect(result.contains('DevicePreview'), isFalse);
    });
  });
}

List<FramyObject> getFramyPageObjectWithDependency(
    FramyObjectDependency dependency) {
  return [
    FramyObject()
      ..name = 'Widget1'
      ..type = FramyObjectType.page
      ..constructors = [
        FramyObjectConstructor('', [dependency])
      ],
  ];
}
