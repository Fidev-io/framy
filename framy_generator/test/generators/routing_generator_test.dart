import 'package:framy_generator/generator/routing_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Routing generator result', () {
    test('should contain PageRouteBuilder', () {
      final result = generateRouting();
      expect(result.contains('PageRouteBuilder'), isTrue);
    });

    test('should contain FramyFontsPage', () {
      final result = generateRouting();
      expect(result.contains('FramyFontsPage'), isTrue);
    });

    test('should contain FramyLayoutTemplate', () {
      final result = generateRouting();
      expect(result.contains('FramyLayoutTemplate'), isTrue);
    });
  });
}
