import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FramyApp Generator result', () {
    test('should start with FramyApp class', () {
      final result = generateFramyApp();
      expect(result.startsWith('class FramyApp'), isTrue);
    });

    test('should contain MaterialApp', () {
      final result = generateFramyApp();
      expect(result.contains('MaterialApp'), isTrue);
    });

    test('should contain FramyApp Key', () {
      final result = generateFramyApp();
      expect(result.contains('Key(\'FramyApp\')'), isTrue);
    });

    test('should contain onGenerateRoute', () {
      final result = generateFramyApp();
      expect(result.contains('onGenerateRoute'), isTrue);
    });

    test('should not contain theme when empty list passed', () {
      final result = generateFramyApp([]);
      expect(result.contains('theme'), isFalse);
    });

    test('should contain theme when passed', () {
      //given
      final themeDataObject = FramyObject()
        ..type = FramyObjectType.themeData
        ..name = 'getThemeData'
        ..kind = ElementKind.FUNCTION
        ..isStatic = true;
      //when
      final result = generateFramyApp([themeDataObject]);
      //then
      expect(result.contains('theme: getThemeData(),'), isTrue);
    });

    test('should contain theme with parent when parent object is passed', () {
      //given
      final themeDataObject = FramyObject()
        ..type = FramyObjectType.themeData
        ..name = 'getThemeData'
        ..isStatic = false
        ..kind = ElementKind.METHOD
        ..parentObject = (FramyObject()..name = 'CustomAppTheme');
      //when
      final result = generateFramyApp([themeDataObject]);
      //then
      expect(
          result.contains('theme: CustomAppTheme().getThemeData(),'), isTrue);
    });

    test('should contain static theme with parent when parent object is passed',
        () {
      //given
      final themeDataObject = FramyObject()
        ..type = FramyObjectType.themeData
        ..name = 'getThemeData'
        ..isStatic = true
        ..kind = ElementKind.METHOD
        ..parentObject = (FramyObject()..name = 'CustomAppTheme');
      //when
      final result = generateFramyApp([themeDataObject]);
      //then
      expect(result.contains('theme: CustomAppTheme.getThemeData(),'), isTrue);
    });

    test('should contain field theme from parent', () {
      //given
      final themeDataObject = FramyObject()
        ..type = FramyObjectType.themeData
        ..name = 'theme'
        ..isStatic = false
        ..kind = ElementKind.GETTER
        ..parentObject = (FramyObject()..name = 'CustomAppTheme');
      //when
      final result = generateFramyApp([themeDataObject]);
      //then
      expect(result.contains('theme: CustomAppTheme().theme,'), isTrue);
    });

    test('should contain correct themeData', () {
      //given
      final parentObject = FramyObject()..name = 'AppThemeWithGetter';
      final colorObject = FramyObject()
        ..type = FramyObjectType.color
        ..name = 'defaultAvatarColor'
        ..isStatic = true
        ..kind = ElementKind.GETTER
        ..parentObject = parentObject;
      final themeObject = FramyObject()
        ..type = FramyObjectType.themeData
        ..name = 'themeData'
        ..isStatic = true
        ..kind = ElementKind.GETTER
        ..parentObject = parentObject;
      //when
      final result = generateFramyApp([colorObject, themeObject]);
      //then
      expect(result.contains('theme: AppThemeWithGetter.themeData,'), isTrue);
    });
  });
}
