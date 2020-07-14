String generateAppBar() => '''
class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading;

  const FramyAppBar({Key key, @required this.leading}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
      leading: leading,
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
''';
