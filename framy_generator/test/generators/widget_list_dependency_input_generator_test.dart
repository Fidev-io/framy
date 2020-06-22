import 'package:framy_generator/generator/widget_list_dependency_input_generator.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetListDependencyInputGenerator result', () {
    test('should start with class FramyWidgetListDependencyInput', () {
      final result = generateWidgetListDependencyInput();
      expect(result.startsWith('class FramyWidgetListDependencyInput'), isTrue);
    });

    test('should contain Add label for a button', () {
      final result = generateWidgetListDependencyInput();
      expect(result.contains('\'Add\''), isTrue);
    });

    test('should have .add( method call', () {
      final result = generateWidgetListDependencyInput();
      expect(result.contains('.add('), isTrue);
    });

    test('should have FramyWidgetDependencyInput constructor', () {
      final result = generateWidgetListDependencyInput();
      expect(result.contains('FramyWidgetDependencyInput('), isTrue);
    });

    test('should have List element name', () {
      final result = generateWidgetListDependencyInput();
      expect(result.contains('\'List element '), isTrue);
    });
  });
}
