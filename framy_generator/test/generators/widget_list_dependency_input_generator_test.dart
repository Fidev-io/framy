import 'package:framy_generator/generator/widget_list_dependency_input_generator.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetListDependencyInputGenerator result', () {
    test('should start with class FramyWidgetListDependencyInput', () {
      final result = generateWidgetListDependencyInput();
      expect(result.startsWith('class FramyWidgetListDependencyInput'), isTrue);
    });
  });
}
