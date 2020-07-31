import 'package:framy_generator/config/framy_config.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/framy_app_generator.dart';
import 'package:test/test.dart';

void main() {
  group('FramyApp Generator result', () {
    test('should contain FramyApp class', () {
      final result = generateFramyApp([], false, FramyConfig());
      expect(result.contains('class FramyApp'), isTrue);
    });

    test('should contain MaterialApp', () {
      final result = generateFramyApp([], false, FramyConfig());
      expect(result.contains('MaterialApp'), isTrue);
    });

    test('should contain FramyApp Key', () {
      final result = generateFramyApp([], false, FramyConfig());
      expect(result.contains('Key(\'FramyApp\')'), isTrue);
    });

    test('should contain onGenerateRoute', () {
      final result = generateFramyApp([], false, FramyConfig());
      expect(result.contains('onGenerateRoute'), isTrue);
    });

    test('should not contain theme when empty list passed', () {
      final result = generateFramyApp([], false, FramyConfig());
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
      final result = generateFramyApp([themeDataObject], false, FramyConfig());
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
      final result = generateFramyApp([themeDataObject], false, FramyConfig());
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
      final result = generateFramyApp([themeDataObject], false, FramyConfig());
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
      final result = generateFramyApp([themeDataObject], false, FramyConfig());
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
      final result =
          generateFramyApp([colorObject, themeObject], false, FramyConfig());
      //then
      expect(result.contains('theme: AppThemeWithGetter.themeData,'), isTrue);
    });

    test('should contain declaration of framyAppStateKey', () {
      //when
      final result = generateFramyApp([], false, FramyConfig());
      //then
      expect(
          result.contains(
              'final framyAppStateKey = GlobalKey<_FramyAppState>();'),
          isTrue);
    });

    test('should contain class FramyAppSettings', () {
      //when
      final result = generateFramyApp([], false, FramyConfig());
      //then
      expect(result.contains('class FramyAppSettings'), isTrue);
    });

    test('should add a ProviderScope when there are riverpod dependencies', () {
      //when
      final result = generateFramyApp([], true, FramyConfig());
      //then
      expect(result.contains('ProviderScope'), isTrue);
    });

    test('should use default values from FramyConfig', () {
      final result = generateFramyApp(
        [],
        false,
        FramyConfig()
          ..wrapWithCenter = true
          ..wrapWithScaffold = false
          ..wrapWithSafeArea = null,
      );
      expect(result.contains('bool _wrapWithCenter = true;'), isTrue);
      expect(result.contains('bool _wrapWithScaffold = false;'), isTrue);
      expect(result.contains('bool _wrapWithSafeArea = null;'), isTrue);
    });
  });
}
