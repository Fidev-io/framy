String generateAppBar() => '''
class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
      actions: [
        IconButton(
          key: ValueKey('FramyAppBarSettingsButton'),
          icon: Icon(Icons.settings),
          onPressed: () =>
              showDialog(
                context: context,
                useRootNavigator: false,
                builder: (context) => FramySettingsDialog(),
              ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Wrap with Scaffold'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppScaffoldSwitch'),
                onChanged: (b) => framyAppStateKey.currentState.wrapWithScaffold = b,
                value: FramyAppSettings.of(context).wrapWithScaffold,
              ),
            ],
          ),
          Row(
            children: [
              Text('Wrap with Center'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppCenterSwitch'),
                onChanged: (b) => framyAppStateKey.currentState.wrapWithCenter = b,
                value: FramyAppSettings.of(context).wrapWithCenter,
              ),
            ],
          ),
          Row(
            children: [
              Text('Wrap with SafeArea'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppSafeAreaSwitch'),
                onChanged: (b) => framyAppStateKey.currentState.wrapWithSafeArea = b,
                value: FramyAppSettings.of(context).wrapWithSafeArea,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
''';
