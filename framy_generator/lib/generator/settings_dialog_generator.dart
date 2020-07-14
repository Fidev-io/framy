String generateSettingsDialog(bool useDevicePreview) => '''
class FramySettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Preview settings'),
      actions: [
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ${_devicePreviewSwitch(useDevicePreview)}
            Row(
              children: [
                Expanded(child: Text('Wrap with Scaffold')),
                Switch(
                  key: ValueKey('FramyAppScaffoldSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithScaffold = b,
                  value: FramyAppSettings.of(context).wrapWithScaffold,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Wrap with Center')),
                Switch(
                  key: ValueKey('FramyAppCenterSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithCenter = b,
                  value: FramyAppSettings.of(context).wrapWithCenter,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text('Wrap with SafeArea')),
                Switch(
                  key: ValueKey('FramyAppSafeAreaSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithSafeArea = b,
                  value: FramyAppSettings.of(context).wrapWithSafeArea,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
''';

String _devicePreviewSwitch(bool usesDevicePreview) => usesDevicePreview
    ? _enabledDevicePreviewSwitch()
    : _disabledDevicePreviewSwitch();

String _disabledDevicePreviewSwitch() => '''
Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Device Preview disabled'),
          SelectableText(
            'framy.dev/#/device_preview',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    ),
    Switch(
      key: ValueKey('FramyAppDevicePreviewSwitch'),
      onChanged: null,
      value: false,
    ),
  ],
),
''';

String _enabledDevicePreviewSwitch() => '''
Row(
  children: [
    Expanded(child: Text('Wrap with Device Preview')),
    Switch(
      key: ValueKey('FramyAppDevicePreviewSwitch'),
      onChanged: (b) => framyAppStateKey.currentState.wrapWithDevicePreview = b,
      value: FramyAppSettings.of(context).wrapWithDevicePreview,
    ),
  ],
),
''';
