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

    test('should contain copy widget.dependencies to dependencies', () {
      final result = generateCustomPage(false);
      expect(result.contains('dependencies = widget.dependencies'), isTrue);
    });

    test('should contain getting wrapWithScaffold value from FramyAppSettings',
        () {
      final result = generateCustomPage(false);
      expect(result.contains('settings.wrapWithScaffold'), isTrue);
    });

    test('should contain getting wrapWithCenter value from FramyAppSettings',
        () {
      final result = generateCustomPage(false);
      expect(result.contains('settings.wrapWithCenter'), isTrue);
    });

    test('should contain getting wrapWithSafeArea value from FramyAppSettings',
        () {
      final result = generateCustomPage(false);
      expect(result.contains('settings.wrapWithSafeArea'), isTrue);
    });

    test('should contain Center', () {
      final result = generateCustomPage(false);
      expect(result.contains('Center('), isTrue);
    });

    test('should contain Scaffold', () {
      final result = generateCustomPage(false);
      expect('Scaffold('.allMatches(result), hasLength(2));
    });

    test('should contain SafeArea', () {
      final result = generateCustomPage(false);
      expect('SafeArea('.allMatches(result), hasLength(2));
    });

    test('should contain enabled parameter for DevicePreview', () {
      final result = generateCustomPage(true);
      expect(
        result.contains(
            'enabled: FramyAppSettings.of(context).wrapWithDevicePreview,'),
        isTrue,
      );
    });

    test('should contain currentTabIndex field', () {
      final result = generateCustomPage(false);
      expect(result.contains('int currentTabIndex = 0;'), isTrue);
    });

    test('should contain default dependenciesPanelWidth', () {
      final result = generateCustomPage(false);
      expect(result.contains('double dependenciesPanelWidth = 300;'), isTrue);
    });

    test('should contain onHorizontalDragUpdate', () {
      final result = generateCustomPage(false);
      expect(result.contains('onHorizontalDragUpdate'), isTrue);
    });
  });
}
