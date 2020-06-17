import 'package:framy_generator/generator/widget_dependencies_panel_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateWidgetDependenciesPanel result', () {
    test('should start with a class', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.startsWith('class FramyWidgetDependenciesPanel'), isTrue);
    });

    test('should contain key FramyWidgetDependenciesPanel', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('Key(\'FramyWidgetDependenciesPanel\')'), isTrue);
    });

    test('should contain dependencies list', () {
      final result = generateWidgetDependenciesPanel();
      expect(
        result.contains('final List<FramyDependencyModel> dependencies;'),
        isTrue,
      );
    });

    test('should contain onChanged callback', () {
      final result = generateWidgetDependenciesPanel();
      expect(
        result.contains(
            'final void Function(String name, dynamic value) onChanged;'),
        isTrue,
      );
    });

    test('should contain mapping dependencies', () {
      final result = generateWidgetDependenciesPanel();
      expect(
        result.contains(RegExp('dependencies\n *\\.map\\(')),
        isTrue,
      );
    });

    test('should contain class FramyWidgetDependencyInput', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('class FramyWidgetDependencyInput'), isTrue);
    });

    test('should contain input key concatenation', () {
      final result = generateWidgetDependenciesPanel();
      expect(
          result
              .contains('Key(\'framy_dependency_\${dependency.name}_input\')'),
          isTrue);
    });

    test('should contain dependency.name', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('dependency.name'), isTrue);
    });

    test('should contain onChanged invocation', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('onChanged('), isTrue);
    });

    test('should contain class FramyWidgetDependenciesFAB', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('class FramyWidgetDependenciesFAB'), isTrue);
    });

    test('should contain class key FramyWidgetDependenciesButton', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('Key(\'FramyWidgetDependenciesButton\')'), isTrue);
    });
  });
}
