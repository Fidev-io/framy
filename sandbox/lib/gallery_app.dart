import 'package:flutter/material.dart';
import 'material_components_group.dart';

import 'colors_page.dart';
import 'fonts_page.dart';
import 'home_page.dart';

class FramyGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framy Gallery App',
      onGenerateRoute: generateRoute,
    );
  }
}

class PageConfig {
  final String displayName;
  final String path;
  final WidgetBuilder builder;

  PageConfig(this.displayName, this.path, this.builder);
}

final homePageConfig = PageConfig('Home', '/', (_) => HomePage());

final pageConfigs = <PageConfig>[
  homePageConfig,
  PageConfig('Fonts', '/fonts', (_) => FontsPage()),
  PageConfig('Colors', '/colors', (_) => ColorsPage()),
  PageConfig(
      'Material components', '/material', (_) => MaterialComponentsPage()),
  ...otherConfigs,
];

final otherConfigs = <PageConfig>[];

Route<dynamic> generateRoute(RouteSettings settings) {
  final pageConfig = pageConfigs.firstWhere(
    (pageConfig) => pageConfig.path == settings.name,
    orElse: () => homePageConfig,
  );
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => MyLayoutBuilder(pageConfig: pageConfig),
    settings: settings,
  );
}

class MyLayoutBuilder extends StatelessWidget {
  final PageConfig pageConfig;

  const MyLayoutBuilder({Key key, @required this.pageConfig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final isSmall = mediaQuery.size.width < 900;
        return Scaffold(
          appBar: AppBar(title: Text(pageConfig.displayName)),
          drawer: isSmall ? MyDrawer(pageConfigs: pageConfigs) : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (!isSmall) MyDrawer(pageConfigs: pageConfigs),
              Expanded(
                child: pageConfig.builder(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  final List<PageConfig> pageConfigs;

  const MyDrawer({Key key, @required this.pageConfigs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: pageConfigs.map((config) {
          return ListTile(
            title: Text(config.displayName),
            onTap: () => Navigator.pushReplacementNamed(context, config.path),
          );
        }).toList(),
      ),
    );
  }
}
