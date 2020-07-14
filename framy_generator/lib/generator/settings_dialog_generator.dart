String generateSettingsDialog() => '''
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
            Row(
              children: [
                Expanded(child: Text('Wrap with Device Preview')),
                Switch(
                  key: ValueKey('FramyAppDevicePreviewSwitch'),
                  onChanged: (b) =>
                      framyAppStateKey.currentState.wrapWithDevicePreview = b,
                  value: FramyAppSettings.of(context).wrapWithDevicePreview,
                ),
              ],
            ),
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
