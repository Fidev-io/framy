import 'package:framy_generator/generator/app_bar_generator.dart';
import 'package:test/test.dart';

void main() {
  group('AppBar Generator result', () {
    test('should start with class declaration', () {
      final result = generateAppBar();
      expect(result.startsWith('class FramyAppBar'), isTrue);
    });

    test('should have a key', () {
      final result = generateAppBar();
      expect(result.contains('Key(\'FramyAppBar\')'), isTrue);
    });

    test('should have a proper title', () {
      final result = generateAppBar();
      expect(result.contains('title: Text(\'Framy App\')'), isTrue);
    });

    test('should use PreferredSizeWidget', () {
      final result = generateAppBar();
      expect(result.contains('with PreferredSizeWidget'), isTrue);
    });

    test('should return AppBar height size', () {
      final result = generateAppBar();
      expect(
        result.contains(
            'Size get preferredSize => Size.fromHeight(kToolbarHeight);'),
        isTrue,
      );
    });

    test('should contain key for Settings button', () {
      final result = generateAppBar();
      expect(
        result.contains('key: ValueKey(\'FramyAppBarSettingsButton\')'),
        isTrue,
      );
    });

    test('should contain leading icon', () {
      final result = generateAppBar();
      expect(result.contains('leading: leading,'), isTrue);
    });
  });
}
