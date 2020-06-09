import 'package:framy_generator/generator/colors_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('ColorsPage generator result', () {
    test('should start with FramyColorsPage class', () {
      final result = generateColorsPage();
      expect(result.startsWith('class FramyColorsPage'), isTrue);
    });

    test('should contain key FramyColorsPage', () {
      final result = generateColorsPage();
      expect(result.contains('Key(\'FramyColorsPage\')'), isTrue);
    });

    test('should contain theme color labels', () {
      final result = generateColorsPage();
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
      final result = generateColorsPage();
      expect(result.contains('Theme.of(context).primaryColor'), isTrue);
      expect(result.contains('Theme.of(context).primaryColorLight'), isTrue);
      expect(result.contains('Theme.of(context).primaryColorDark'), isTrue);
      expect(result.contains('Theme.of(context).canvasColor'), isTrue);
      expect(result.contains('Theme.of(context).accentColor'), isTrue);
      expect(result.contains('Theme.of(context).scaffoldBackgroundColor'), isTrue);
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
      expect(result.contains('Theme.of(context).textSelectionHandleColor'), isTrue);
      expect(result.contains('Theme.of(context).backgroundColor'), isTrue);
      expect(result.contains('Theme.of(context).dialogBackgroundColor'), isTrue);
      expect(result.contains('Theme.of(context).indicatorColor'), isTrue);
      expect(result.contains('Theme.of(context).hintColor'), isTrue);
      expect(result.contains('Theme.of(context).errorColor'), isTrue);
      expect(result.contains('Theme.of(context).toggleableActiveColor'), isTrue);
    });
  });
}
