String generateAppBar() => '''
class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
''';
