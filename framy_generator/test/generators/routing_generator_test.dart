import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/routing_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Routing generator result', () {
    test('should contain PageRouteBuilder', () {
      final result = generateRouting([]);
      expect(result.contains('PageRouteBuilder'), isTrue);
    });

    test('should contain FramyFontsPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyFontsPage'), isTrue);
    });

    test('should contain FramyLayoutTemplate', () {
      final result = generateRouting([]);
      expect(result.contains('FramyLayoutTemplate'), isTrue);
    });

    test('should contain FramyColorsPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyColorsPage'), isTrue);
    });

    test('should contain FramyAppBarPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyAppBarPage'), isTrue);
    });

    test('should contain FramyButtonPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyButtonPage'), isTrue);
    });

    test('should contain FramyTogglePage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyTogglePage'), isTrue);
    });

    test('should contain FramyTextFieldPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyTextFieldPage'), isTrue);
    });

    test(
        'should contain dynamically generated widget page name when widget object is passed',
        () {
      //given
      final framyObjects = [
        FramyObject()
          ..name = 'MyCustomWidget'
          ..type = FramyObjectType.widget
      ];
      //when
      final result = generateRouting(framyObjects);
      //then
      expect(result.contains('FramyMyCustomWidgetCustomPage'), isTrue);
    });

    test(
        'should contain dynamically generated page name when page object is passed',
        () {
      //given
      final framyObjects = [
        FramyObject()
          ..name = 'MyHomePage'
          ..type = FramyObjectType.page
      ];
      //when
      final result = generateRouting(framyObjects);
      //then
      expect(result.contains('FramyMyHomePageCustomPage'), isTrue);
    });

    test('should contain FramyStoryboardPage', () {
      final result = generateRouting([]);
      expect(result.contains('FramyStoryboardPage'), isTrue);
    });
  });
}
