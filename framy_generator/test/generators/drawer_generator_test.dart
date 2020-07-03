import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/drawer_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Drawer generator result', () {
    test('should start with class FramyDrawer', () {
      final String result = generateDrawer([]);
      expect(result.startsWith('class FramyDrawer'), isTrue);
    });

    test('should contain FramyDrawer key', () {
      final String result = generateDrawer([]);
      expect(result.contains('Key(\'FramyDrawer\')'), isTrue);
    });

    test('should contain Typography Text', () {
      final String result = generateDrawer([]);
      expect(result.contains('Text(\'Typography\''), isTrue);
    });

    test('should contain Color scheme Text', () {
      final String result = generateDrawer([]);
      expect(result.contains('Text(\'Color scheme\''), isTrue);
    });

    test('should contain /colors route name', () {
      final String result = generateDrawer([]);
      expect(result.contains('\'/colors\''), isTrue);
    });

    test('should contain /typography route name', () {
      final String result = generateDrawer([]);
      expect(result.contains('\'/typography\''), isTrue);
    });

    group('Material components', () {
      test('should contain Material components text', () {
        final String result = generateDrawer([]);
        expect(result.contains('\'Material components\''), isTrue);
      });

      test('should contain AppBar text', () {
        final String result = generateDrawer([]);
        expect(result.contains('Text(\'AppBar\''), isTrue);
      });

      test('should contain /appbar route name', () {
        final String result = generateDrawer([]);
        expect(result.contains('\'/appbar\''), isTrue);
      });

      test('should contain Button text', () {
        final String result = generateDrawer([]);
        expect(result.contains('Text(\'Button\''), isTrue);
      });

      test('should contain /button route name', () {
        final String result = generateDrawer([]);
        expect(result.contains('\'/button\''), isTrue);
      });

      test('should contain MaterialComponentsButtonButton key', () {
        final String result = generateDrawer([]);
        expect(
            result.contains('Key(\'MaterialComponentsButtonButton\')'), isTrue);
      });

      test('should contain Toggle text', () {
        final String result = generateDrawer([]);
        expect(result.contains('Text(\'Toggle\''), isTrue);
      });

      test('should contain /toggle route name', () {
        final String result = generateDrawer([]);
        expect(result.contains('\'/toggle\''), isTrue);
      });

      test('should contain TextField text', () {
        final String result = generateDrawer([]);
        expect(result.contains('Text(\'TextField\''), isTrue);
      });

      test('should contain /textfield route name', () {
        final String result = generateDrawer([]);
        expect(result.contains('\'/textfield\''), isTrue);
      });
    });

    group('when custom widget is given', () {
      //given
      final widgetsFramyObjects = [
        FramyObject()
          ..type = FramyObjectType.widget
          ..name = 'MyCustomWidget'
      ];

      test('should contain widget name', () {
        //when
        final result = generateDrawer(widgetsFramyObjects);
        //then
        expect(
          result.contains('Text(\'MyCustomWidget\''),
          isTrue,
        );
      });

      test('should contain /widgetName route name', () {
        //when
        final result = generateDrawer(widgetsFramyObjects);
        //then
        expect(
          result.contains('\'/MyCustomWidget\''),
          isTrue,
        );
      });
    });
  });
}
