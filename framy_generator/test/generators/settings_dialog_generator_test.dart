import 'package:framy_generator/generator/settings_dialog_generator.dart';
import 'package:test/test.dart';

void main() {
  test('should contain key for Scaffold switch', () {
    final result = generateSettingsDialog(false);
    expect(
      result.contains('key: ValueKey(\'FramyAppScaffoldSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for Center switch', () {
    final result = generateSettingsDialog(false);
    expect(
      result.contains('key: ValueKey(\'FramyAppCenterSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for SafeArea switch', () {
    final result = generateSettingsDialog(false);
    expect(
      result.contains('key: ValueKey(\'FramyAppSafeAreaSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for DevicePreview switch', () {
    final result = generateSettingsDialog(false);
    expect(
      result.contains('key: ValueKey(\'FramyAppDevicePreviewSwitch\')'),
      isTrue,
    );
  });

  test('should contain onChanged: null when devicePreview is disabled', () {
    final result = generateSettingsDialog(false);
    expect(result.contains('onChanged: null,'), isTrue);
    expect(
      result.contains(
          'onChanged: (b) => framyAppStateKey.currentState.wrapWithDevicePreview = b,'),
      isFalse,
    );
  });

  test('should contain devicePreview callback when devicePreview is enabled',
      () {
    final result = generateSettingsDialog(true);
    expect(result.contains('onChanged: null,'), isFalse);
    expect(
      result.contains(
          'onChanged: (b) => framyAppStateKey.currentState.wrapWithDevicePreview = b,'),
      isTrue,
    );
  });
}
