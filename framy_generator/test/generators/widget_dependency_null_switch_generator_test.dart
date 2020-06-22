import 'package:framy_generator/generator/widget_dependency_null_switch_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Widget dependency null switch', () {
    test('should start with class FramyWidgetDependencyNullSwitch', () {
      String result = generateWidgetDependencyNullSwitch();
      expect(result.contains('class FramyWidgetDependencyNullSwitch'), isTrue);
    });

    test('should contain check if value is null', () {
      String result = generateWidgetDependencyNullSwitch();
      expect(result.contains('dependency.value == null'), isTrue);
    });

    test('should contain onChanged(null)', () {
      String result = generateWidgetDependencyNullSwitch();
      expect(result.contains('onChanged(null)'), isTrue);
    });

    test('should contain onChanged(framyModelConstructorMap[dependency.type]?.call(dependency))', () {
      String result = generateWidgetDependencyNullSwitch();
      expect(result.contains('onChanged(framyModelConstructorMap[dependency.type]?.call(dependency))'), isTrue);
    });
  });
}
