import 'package:test/test.dart';
import 'package:weight_tracker/main.app.framy.dart';

void main() {
  group('createSubDependencies method', () {
    test('should return default subDependencies for WeightEntry', () {
      final subDependencies = createSubDependencies('WeightEntry');
      expect(subDependencies, hasLength(3));
    });

    test('should return dependencies for .now constructor when its passed', () {
      final subDependencies = createSubDependencies('WeightEntry', '.now');
      expect(subDependencies, hasLength(1));
    });
  });
}
