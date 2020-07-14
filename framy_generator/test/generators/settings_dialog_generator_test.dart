import 'package:framy_generator/generator/settings_dialog_generator.dart';
import 'package:test/test.dart';

void main() {
  test('should contain key for Scaffold switch', () {
    final String result = generateSettingsDialog();
    expect(
      result.contains('key: ValueKey(\'FramyAppScaffoldSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for Center switch', () {
    final String result = generateSettingsDialog();
    expect(
      result.contains('key: ValueKey(\'FramyAppCenterSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for SafeArea switch', () {
    final String result = generateSettingsDialog();
    expect(
      result.contains('key: ValueKey(\'FramyAppSafeAreaSwitch\')'),
      isTrue,
    );
  });

  test('should contain key for DevicePreview switch', () {
    final String result = generateSettingsDialog();
    expect(
      result.contains('key: ValueKey(\'FramyAppDevicePreviewSwitch\')'),
      isTrue,
    );
  });
}
