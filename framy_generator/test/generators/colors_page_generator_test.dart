import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/colors_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('ColorsPage generator result', () {
    test('should start with FramyColorsPage class', () {
      final result = generateColorsPage([]);
      expect(result.startsWith('class FramyColorsPage'), isTrue);
    });

    test('should contain key FramyColorsPage', () {
      final result = generateColorsPage([]);
      expect(result.contains('Key(\'FramyColorsPage\')'), isTrue);
    });

    test('should contain theme color labels', () {
      final result = generateColorsPage([]);
      expect(result.contains('Primary'), isTrue);
      expect(result.contains('Primary light'), isTrue);
      expect(result.contains('Primary dark'), isTrue);
      expect(result.contains('Canvas'), isTrue);
      expect(result.contains('Accent'), isTrue);
      expect(result.contains('Scaffold background'), isTrue);
      expect(result.contains('Focus'), isTrue);
      expect(result.contains('Hover'), isTrue);
      expect(result.contains('Highlight'), isTrue);
      expect(result.contains('Splash'), isTrue);
      expect(result.contains('Disabled'), isTrue);
      expect(result.contains('Button'), isTrue);
      expect(result.contains('Text selection'), isTrue);
      expect(result.contains('Cursor'), isTrue);
      expect(result.contains('Text selection handle'), isTrue);
      expect(result.contains('Background'), isTrue);
      expect(result.contains('Dialog background'), isTrue);
      expect(result.contains('Indicator'), isTrue);
      expect(result.contains('Hint'), isTrue);
      expect(result.contains('Error'), isTrue);
      expect(result.contains('Toggleable Active'), isTrue);
    });

    test('should contain theme color values', () {
      final result = generateColorsPage([]);
      expect(result.contains('Theme.of(context).primaryColor'), isTrue);
      expect(result.contains('Theme.of(context).primaryColorLight'), isTrue);
      expect(result.contains('Theme.of(context).primaryColorDark'), isTrue);
      expect(result.contains('Theme.of(context).canvasColor'), isTrue);
      expect(result.contains('Theme.of(context).accentColor'), isTrue);
      expect(
          result.contains('Theme.of(context).scaffoldBackgroundColor'), isTrue);
      expect(result.contains('Theme.of(context).bottomAppBarColor'), isTrue);
      expect(result.contains('Theme.of(context).cardColor'), isTrue);
      expect(result.contains('Theme.of(context).dividerColor'), isTrue);
      expect(result.contains('Theme.of(context).focusColor'), isTrue);
      expect(result.contains('Theme.of(context).hoverColor'), isTrue);
      expect(result.contains('Theme.of(context).highlightColor'), isTrue);
      expect(result.contains('Theme.of(context).splashColor'), isTrue);
      expect(result.contains('Theme.of(context).disabledColor'), isTrue);
      expect(result.contains('Theme.of(context).buttonColor'), isTrue);
      expect(result.contains('Theme.of(context).textSelectionColor'), isTrue);
      expect(result.contains('Theme.of(context).cursorColor'), isTrue);
      expect(result.contains('Theme.of(context).textSelectionHandleColor'),
          isTrue);
      expect(result.contains('Theme.of(context).backgroundColor'), isTrue);
      expect(
          result.contains('Theme.of(context).dialogBackgroundColor'), isTrue);
      expect(result.contains('Theme.of(context).indicatorColor'), isTrue);
      expect(result.contains('Theme.of(context).hintColor'), isTrue);
      expect(result.contains('Theme.of(context).errorColor'), isTrue);
      expect(
          result.contains('Theme.of(context).toggleableActiveColor'), isTrue);
    });

    test('should contain custom colors from color framy objects', () {
      //given
      final colorFramyObjects = [
        FramyObject()
          ..type = FramyObjectType.color
          ..name = 'customColor1'
          ..kind = ElementKind.GETTER
          ..isStatic = false
          ..parentObject = (FramyObject()..name = 'AppTheme')
      ];
      //when
      final result = generateColorsPage(colorFramyObjects);
      //then
      expect(
        result.contains(
            '_FramyColorItem(name: \'customColor1\', color: AppTheme().customColor1,),'),
        isTrue,
      );
    });

    test('should ignore non-color framy objects', () {
      //given
      final framyObjects = [
        FramyObject()
          ..type = FramyObjectType.themeData
          ..name = 'myTheme'
          ..kind = ElementKind.GETTER
          ..isStatic = true
      ];
      //when
      final result = generateColorsPage(framyObjects);
      //then
      expect(result.contains('myTheme'), isFalse);
    });

    test('should contain color scheme values', () {
      final result = generateColorsPage([]);
      expect(result.contains('Theme.of(context).colorScheme.primary'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.primaryVariant'),
          isTrue);
      expect(
          result.contains('Theme.of(context).colorScheme.secondary'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.secondaryVariant'),
          isTrue);
      expect(
          result.contains('Theme.of(context).colorScheme.background'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.surface'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.error'), isTrue);
      expect(
          result.contains('Theme.of(context).colorScheme.onPrimary'), isTrue);
      expect(
          result.contains('Theme.of(context).colorScheme.onSecondary'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.onBackground'),
          isTrue);
      expect(
          result.contains('Theme.of(context).colorScheme.onSurface'), isTrue);
      expect(result.contains('Theme.of(context).colorScheme.onError'), isTrue);
    });

    test('should contain Color Scheme labels', () {
      final result = generateColorsPage([]);
      expect(result.contains('Primary'), isTrue);
      expect(result.contains('Primary variant'), isTrue);
      expect(result.contains('Secondary'), isTrue);
      expect(result.contains('Secondary variant'), isTrue);
      expect(result.contains('Background'), isTrue);
      expect(result.contains('Surface'), isTrue);
      expect(result.contains('Error'), isTrue);
      expect(result.contains('On primary'), isTrue);
      expect(result.contains('On secondary'), isTrue);
      expect(result.contains('On background'), isTrue);
      expect(result.contains('On surface'), isTrue);
      expect(result.contains('On error'), isTrue);
    });
  });
}
