import 'package:framy_generator/generator/widget_cutom_page_template_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateCustomPage result', () {
    test('should contain LayoutBuilder', () {
      final result = generateCustomPage(false);
      expect(result.contains('LayoutBuilder('), isTrue);
    });

    test('should contain list with dependencies', () {
      final result = generateCustomPage(false);
      expect(
          result.contains('List<FramyDependencyModel> dependencies'), isTrue);
    });

    test('should contain FramyWidgetDependenciesPanel', () {
      final result = generateCustomPage(false);
      expect(result.contains('FramyWidgetDependenciesPanel('), isTrue);
    });

    test('should contain FramyWidgetDependenciesFAB', () {
      final result = generateCustomPage(false);
      expect(result.contains('FramyWidgetDependenciesFAB('), isTrue);
    });

    test('should have an initialized presets field', () {
      final result = generateCustomPage(false);
      expect(
        result.contains(
            'final Map<String, Map<String, dynamic>> presets = createFramyPresets();'),
        isTrue,
      );
    });

    test('should contain definition of onChanged method', () {
      final result = generateCustomPage(false);
      expect(
        result.contains('void onChanged(FramyDependencyModel dependencyModel)'),
        isTrue,
      );
    });

    test('should contain DevicePreview when true as param is passed', () {
      final result = generateCustomPage(true);
      expect(
        result.contains('DevicePreview('),
        isTrue,
      );
    });

    test('should not contain DevicePreview when false as param is passed', () {
      final result = generateCustomPage(false);
      expect(
        result.contains('DevicePreview('),
        isFalse,
      );
    });

    test('should not contain DevicePreview when false as param is passed', () {
      final result = generateCustomPage(false);
      expect(
        result.contains('DevicePreview('),
        isFalse,
      );
    });

    test('should contain copy widget.dependencies to dependencies', () {
      final result = generateCustomPage(false);
      expect(result.contains('dependencies = widget.dependencies'), isTrue);
    });
  });
}
