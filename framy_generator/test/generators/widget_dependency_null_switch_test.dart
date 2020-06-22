import 'package:framy_generator/generator/widget_dependency_null_switch_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Widget dependency null switch', () {
    test('should start with class FramyWidgetDependencyNullSwitch', () {
      String result = generateWidgetDependencyNullSwitch();
      expect(result.contains('class FramyWidgetDependencyNullSwitch'), isTrue);
    });
  });
}
