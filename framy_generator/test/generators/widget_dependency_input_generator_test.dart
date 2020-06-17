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

    test('should contain 2 checks for type int', () {
      final result = generateWidgetDependencyInput();
      expect('dependency.type == FramyDependencyType.int'.allMatches(result),
          hasLength(2));
    });

    test('should contain validator', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('validator'), isTrue);
    });

    test('should contain autovalidate: true', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('autovalidate: true'), isTrue);
    });

    test('should contain error message Invalid integer value', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('\'Invalid integer value\''), isTrue);
    });

    test('should contain 2 checks for type double', () {
      final result = generateWidgetDependencyInput();
      expect('dependency.type == FramyDependencyType.double'.allMatches(result),
          hasLength(2));
    });

    test('should contain error message Invalid double value', () {
      final result = generateWidgetDependencyInput();
      expect(result.contains('\'Invalid double value\''), isTrue);
    });

    test('should contain check for type bool', () {
      final result = generateWidgetDependencyInput();
      expect(
        result.contains('dependency.type == FramyDependencyType.bool'),
        isTrue,
      );
    });

    test('should contain DropdownButton<bool>', () {
      final result = generateWidgetDependencyInput();
      expect(
        result.contains('DropdownButton<bool>'),
        isTrue,
      );
    });

    test('should contain TextFormField', () {
      final result = generateWidgetDependencyInput();
      expect(
        result.contains('TextFormField'),
        isTrue,
      );
    });
  });
}
