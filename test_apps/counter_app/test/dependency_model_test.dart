import 'package:counter_app/main.app.framy.dart';
import 'package:test/test.dart';

///Some of dependency model tests are in WeightTracker App as well
void main() {
  group('FramyDependencyModel', () {
    test('isFunction returns false for String', () {
      final model = FramyDependencyModel<String>('', 'String', null);
      expect(model.isFunction, isFalse);
    });

    test('isFunction returns true for functions', () {
      final model =
          FramyDependencyModel<Function()>('', 'void Function()', null);
      expect(model.isFunction, isTrue);
    });

    test('function model has default callback', () {
      final model =
          FramyDependencyModel<Function()>('', 'void Function()', null);
      expect(model.value, isNotNull);
    });

    test('default function callback adds calls to the model', () {
      //given
      final model =
          FramyDependencyModel<Function()>('foo', 'void Function()', null);
      //when
      model.value();
      model.value();
      //then
      expect(model.functionCalls.calls, hasLength(2));
      expect(model.functionCalls.calls.first.functionName, 'foo');
      expect(model.functionCalls.calls.first.params, []);
    });
  });
}
