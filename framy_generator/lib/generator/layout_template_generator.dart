String generateLayoutTemplate() => '''
class FramyLayoutTemplate extends StatelessWidget {
  final Widget child;

  const FramyLayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxWidth < 1000;
        return Scaffold(
          appBar: FramyAppBar(),
          body: Row(
            children: [
              if (!isSmallDevice) FramyDrawer(),
              Expanded(
                child: child,
              ),
            ],
          ),
          drawer: isSmallDevice ? FramyDrawer() : null,
        );
      },
    );
  }
}
''';

//String generateLayoutBuilder() => '''
//
//class PageConfig {
//  final String displayName;
//  final String path;
//  final WidgetBuilder builder;
//
//  PageConfig(this.displayName, this.path, this.builder);
//}
//
//final homePageConfig = PageConfig('Home', '/', (_) => HomePage());
//
//final pageConfigs = <PageConfig>[
//  homePageConfig,
//  PageConfig('Fonts', '/fonts', (_) => FontsPage()),
//  PageConfig('Colors', '/colors', (_) => ColorsPage()),
//  PageConfig('Material Components', '/matCompos', (_) => MaterialComponentsPage()),
//  ...otherConfigs,
//];
//
//Route<dynamic> generateRoute(RouteSettings settings) {
//  final pageConfig = pageConfigs.firstWhere(
//    (pageConfig) => pageConfig.path == settings.name,
//    orElse: () => homePageConfig,
//  );
//  return PageRouteBuilder<dynamic>(
//    pageBuilder: (_, __, ___) => MyLayoutBuilder(pageConfig: pageConfig),
//    settings: settings,
//  );
//}
//
//class MyLayoutBuilder extends StatelessWidget {
//  final PageConfig pageConfig;
//
//  const MyLayoutBuilder({Key key, @required this.pageConfig}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//      builder: (context, constraints) {
//        final mediaQuery = MediaQuery.of(context);
//        final isSmall = mediaQuery.size.width < 900;
//        return Scaffold(
//          appBar: AppBar(title: Text(pageConfig.displayName)),
//          drawer: isSmall ? MyDrawer(pageConfigs: pageConfigs) : null,
//          body: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              if (!isSmall) MyDrawer(pageConfigs: pageConfigs),
//              Expanded(
//                child: pageConfig.builder(context),
//              ),
//            ],
//          ),
//        );
//      },
//    );
//  }
//}
//
//class MyDrawer extends StatelessWidget {
//  final List<PageConfig> pageConfigs;
//
//  const MyDrawer({Key key, @required this.pageConfigs}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Drawer(
//      child: Column(
//        children: pageConfigs.map((config) {
//          return ListTile(
//            title: Text(config.displayName),
//            onTap: () => Navigator.pushReplacementNamed(context, config.path),
//          );
//        }).toList(),
//      ),
//    );
//  }
//}
//
//''';
