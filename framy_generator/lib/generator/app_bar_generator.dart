String generateAppBar() => '''
class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
      actions: [
        Switch(
          key: ValueKey('FramyAppScaffoldSwitch'),
          onChanged: (b) => framyAppStateKey.currentState.wrapWithScaffold = b,
          value: FramyAppSettingsState.of(context).wrapWithScaffold,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
''';
