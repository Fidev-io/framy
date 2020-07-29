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
        result.contains('final ValueChanged<FramyDependencyModel> onChanged;'),
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

    test('should contain class FramyWidgetDependenciesFAB', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('class FramyWidgetDependenciesFAB'), isTrue);
    });

    test('should contain class key FramyWidgetDependenciesButton', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('Key(\'FramyWidgetDependenciesButton\')'), isTrue);
    });

    test('should have presets field', () {
      final result = generateWidgetDependenciesPanel();
      expect(
        result.contains('final Map<String, Map<String, dynamic>> presets;'),
        isTrue,
      );
    });

    group('FramyWidgetDependenciesFAB', () {
      test('should contain StatefulBuilder', () {
        //for updating state in the modal.
        final result = generateWidgetDependenciesPanel();
        expect(result.contains('StatefulBuilder'), isTrue);
      });

      test('should contain framySheetDragHandle Key', () {
        final result = generateWidgetDependenciesPanel();
        expect(result.contains('Key(\'framySheetDragHandle\')'), isTrue);
      });
    });

    test('should contain BottomNavigationBar with proper labels', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('BottomNavigationBar'), isTrue);
      expect(result.contains('\'Dependencies\''), isTrue);
      expect(result.contains('\'Callbacks\''), isTrue);
    });

    test('should contain onTabIndexChanged callback', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('final ValueChanged<int> onTabIndexChanged;'),
          isTrue);
    });

    test('should contain tabIndex field', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('final int tabIndex;'), isTrue);
    });

    test('should contain class FramyDependenciesTab', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('class FramyDependenciesTab'), isTrue);
    });

    test('should contain class FramyCallbacksTab', () {
      final result = generateWidgetDependenciesPanel();
      expect(result.contains('class FramyCallbacksTab'), isTrue);
    });
  });
}
