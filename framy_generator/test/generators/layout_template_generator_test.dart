import 'package:framy_generator/generator/layout_template_generator.dart';
import 'package:test/test.dart';

void main() {
  group('LayoutTemplate generator result', () {
    test('should start with FramyLayoutTemplate class', () {
      final result = generateLayoutTemplate();
      expect(result.startsWith('class FramyLayoutTemplate'), isTrue);
    });

    test('should contain child field', () {
      final result = generateLayoutTemplate();
      expect(result.contains('final Widget child'), isTrue);
    });

    test('should contain FramyAppBar', () {
      final result = generateLayoutTemplate();
      expect(result.contains('FramyAppBar'), isTrue);
    });

    test('should contain FramyDrawer or null', () {
      final result = generateLayoutTemplate();
      expect(result.contains('FramyDrawer(showHeader: true) : null'), isTrue);
    });

    test('should contain LayoutBuilder', () {
      final result = generateLayoutTemplate();
      expect(result.contains('LayoutBuilder'), isTrue);
    });

    // one for small screens, one for big screens
    test('should contain two FramyDrawers', () {
      final result = generateLayoutTemplate();
      expect('FramyDrawer'.allMatches(result), hasLength(2));
    });

    test('should contain IconButton for leading icon', () {
      final result = generateLayoutTemplate();
      expect(result.contains('IconButton'), isTrue);
    });
  });
}
