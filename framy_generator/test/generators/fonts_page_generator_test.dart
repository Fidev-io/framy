import 'package:framy_generator/generator/fonts_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FontsPage generator result', () {
    test('should start with class definition', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.startsWith('class FramyFontsPage '), isTrue);
    });

    test('should have key', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('Key(\'FramyFontsPage\')'), isTrue);
    });

    test('should have Headline1 text', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('\'Headline1\''), isTrue);
    });

    test('should use Headline1 style', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('textTheme.headline1'), isTrue);
    });

    test('should have a FramySingleFontRow class', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('class FramySingleFontRow'), isTrue);
    });

    test('should have all font labels', () {
      //given
      final allFontLabels = [
        '\'Headline1\'',
        '\'Headline2\'',
        '\'Headline3\'',
        '\'Headline4\'',
        '\'Headline5\'',
        '\'Headline6\'',
        '\'Subtitle1\'',
        '\'Subtitle2\'',
        '\'BodyText1\'',
        '\'BodyText2\'',
        '\'Caption\'',
        '\'Button\'',
        '\'Overline\'',
      ];
      //when
      final String result = generateFontsPage();
      //then
      allFontLabels.forEach((label) => expect(result.contains(label), isTrue));
    });

    test('should use all text styles', () {
      //given
      final allTextStyles = [
        'textTheme.headline1',
        'textTheme.headline2',
        'textTheme.headline3',
        'textTheme.headline4',
        'textTheme.headline5',
        'textTheme.headline6',
        'textTheme.subtitle1',
        'textTheme.subtitle2',
        'textTheme.bodyText1',
        'textTheme.bodyText2',
        'textTheme.caption',
        'textTheme.button',
        'textTheme.overline',
      ];
      //when
      final String result = generateFontsPage();
      //then
      allTextStyles.forEach((style) => expect(result.contains(style), isTrue));
    });

    test('should use textStyle.fontFamily', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.fontFamily'), isTrue);
    });

    test('should use textStyle.fontSize', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.fontSize'), isTrue);
    });

    test('should use textStyle.fontWeight', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.fontWeight'), isTrue);
    });

    test('should use textStyle.color', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.color'), isTrue);
    });

    test('should use textStyle.height', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.height'), isTrue);
    });

    test('should use textStyle.letterSpacing', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.letterSpacing'), isTrue);
    });

    test('should use textStyle.wordSpacing', () {
      //when
      final String result = generateFontsPage();
      //then
      expect(result.contains('style.wordSpacing'), isTrue);
    });
  });
}
