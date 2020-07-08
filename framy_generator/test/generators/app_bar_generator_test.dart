import 'package:framy_generator/generator/app_bar_generator.dart';
import 'package:test/test.dart';

void main() {
  group('AppBar Generator result', () {
    test('should start with class declaration', () {
      //when
      final String result = generateAppBar();
      //then
      expect(result.startsWith('class FramyAppBar'), isTrue);
    });

    test('should have a key', () {
      //when
      final String result = generateAppBar();
      //then
      expect(result.contains('Key(\'FramyAppBar\')'), isTrue);
    });

    test('should have a proper title', () {
      //when
      final String result = generateAppBar();
      //then
      expect(result.contains('title: Text(\'Framy App\')'), isTrue);
    });

    test('should use PreferredSizeWidget', () {
      //when
      final String result = generateAppBar();
      //then
      expect(result.contains('with PreferredSizeWidget'), isTrue);
    });

    test('should return AppBar height size', () {
      //when
      final String result = generateAppBar();
      //then
      expect(
        result.contains(
            'Size get preferredSize => Size.fromHeight(kToolbarHeight);'),
        isTrue,
      );
    });

    test('should contain key for Settings button', () {
      //when
      final String result = generateAppBar();
      //then
      expect(
        result.contains('key: ValueKey(\'FramyAppBarSettingsButton\')'),
        isTrue,
      );
    });

    test('should contain key for Scaffold switch', () {
      //when
      final String result = generateAppBar();
      //then
      expect(
        result.contains('key: ValueKey(\'FramyAppScaffoldSwitch\')'),
        isTrue,
      );
    });

    test('should contain key for Center switch', () {
      //when
      final String result = generateAppBar();
      //then
      expect(
        result.contains('key: ValueKey(\'FramyAppCenterSwitch\')'),
        isTrue,
      );
    });

    test('should contain key for SafeArea switch', () {
      //when
      final String result = generateAppBar();
      //then
      expect(
        result.contains('key: ValueKey(\'FramyAppSafeAreaSwitch\')'),
        isTrue,
      );
    });
  });
}
