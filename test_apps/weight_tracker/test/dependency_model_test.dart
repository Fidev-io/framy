import 'package:test/test.dart';
import 'package:weight_tracker/main.app.framy.dart';
import 'package:weight_tracker/models/user.dart';

void main() {
  group('FramyDependencyModel', () {
    test('uses default empty value for String', () {
      final model = FramyDependencyModel<String>('', 'String', null);
      expect(model.value, '');
    });

    test('uses default 0.0 value for double', () {
      final model = FramyDependencyModel<double>('', 'double', null);
      expect(model.value, 0);
    });

    test('uses default 0 value for int', () {
      final model = FramyDependencyModel<int>('', 'int', null);
      expect(model.value, 0);
    });

    test('uses default false value for boolean', () {
      final model = FramyDependencyModel<bool>('', 'bool', null);
      expect(model.value, false);
    });

    test('uses default custom value for models', () {
      final model = FramyDependencyModel<User>('', 'User', null);
      expect(model.value, isNotNull);
      expect(model.value.firstName, '');
      expect(model.value.lastName, '');
      expect(model.value.age, 0);
      expect(model.value.emails, isEmpty);
    });

    test('creates default subDependencies', () {
      final model = FramyDependencyModel<User>('', 'User', null);
      expect(model.subDependencies, hasLength(4));
    });
  });
}
