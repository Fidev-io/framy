import 'package:framy_generator/generator/drawer_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Drawer generator result', () {
    test('should start with class FramyDrawer', () {
      //when
      final String result = generateDrawer();
      //then
      expect(result.startsWith('class FramyDrawer'), isTrue);
    });

    test('should contain FramyDrawer key', () {
      //when
      final String result = generateDrawer();
      //then
      expect(result.contains('Key(\'FramyDrawer\')'), isTrue);
    });
  });
}
