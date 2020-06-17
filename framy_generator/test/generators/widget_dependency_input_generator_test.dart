import 'package:framy_generator/generator/widget_dependency_input_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateWidgetDependencyInput result', () {
    test('should contain null-safe String initialValue', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('initialValue: dependency.value?.toString()'),
          isTrue);
    });

    test('should contain class FramyWidgetDependencyInput', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('class FramyWidgetDependencyInput'), isTrue);
    });

    test('should contain input key concatenation', () {
      final result = generateWidgetDependencyInput();
      expect(
          result
              .contains('Key(\'framy_dependency_\${dependency.name}_input\')'),
          isTrue);
    });

    test('should contain dependency.name', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('dependency.name'), isTrue);
    });

    test('should contain onChanged invocation', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('onChanged('), isTrue);
    });

    test('should check for type int', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('dependency.type == FramyDependencyType.int'),
          isTrue);
    });
  });
}
