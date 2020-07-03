import 'package:test/test.dart';
import 'package:weight_tracker/main.app.framy.dart';

void main() {
  group('framyAvailableConstructorNames', () {
    test('contains two constructors of WeightEntry', () {
      final constructors = framyAvailableConstructorNames['WeightEntry'];
      expect(constructors, hasLength(2));
      expect(constructors[0], '');
      expect(constructors[1], '.now');
    });

    test('contains the only User constructor', () {
      final constructors = framyAvailableConstructorNames['User'];
      expect(constructors, hasLength(1));
      expect(constructors[0], '');
    });
  });
}
