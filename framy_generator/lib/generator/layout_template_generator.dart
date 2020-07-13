String generateLayoutTemplate() => '''
class FramyLayoutTemplate extends StatelessWidget {
  final Widget child;

  const FramyLayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxWidth < 1000;
        final leading = isSmallDevice
            ? null
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () =>
                    framyAppStateKey.currentState.toggleNavigationMenu(),
                tooltip: FramyAppSettings.of(context).showNavigationMenu
                    ? 'Close navigation menu'
                    : 'Open navigation menu',
              );
        return Scaffold(
          appBar: FramyAppBar(leading: leading),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSmallDevice && FramyAppSettings.of(context).showNavigationMenu) 
                FramyDrawer(),
              Expanded(
                child: child,
              ),
            ],
          ),
          drawer: isSmallDevice ? FramyDrawer(showHeader: true) : null,
        );
      },
    );
  }
}
''';
