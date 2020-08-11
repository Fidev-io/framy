import 'package:framy_generator/test_generator/generate_test_utils.dart';
import 'package:test/test.dart';

void main() {
  group('generate test utils result', () {
    test('should contain extension on WidgetTester', () {
      final result = generateTestUtils([]);
      expect(result.contains('extension on WidgetTester {'), isTrue);
    });

    test('should contain loadRobotoFont method', () {
      final result = generateTestUtils([]);
      expect(result.contains('loadRobotoFont'), isTrue);
    });
  });
}
