// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:framy_annotation/framy_annotation.dart';
import 'package:flutter/material.dart';
import 'package:example/theme.dart';
import 'dart:core';
import 'package:example/user.dart';
import 'package:example/main.dart';
import 'package:flutter/foundation.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(FramyGalleryApp());
}

class FramyGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framy Gallery App',
      theme: AppTheme.getTheme,
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
      'Material Components', '/matCompos', (_) => MaterialComponentsPage()),
  ...otherConfigs,
];

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home'));
  }
}

class FontsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: TextThemeGroup(
        tt: theme.textTheme,
      ),
    );
  }
}

class TextThemeGroup extends StatelessWidget {
  final TextTheme tt;

  const TextThemeGroup({Key key, @required this.tt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FontRow('bodyText1', tt.bodyText1),
          FontRow('bodyText2', tt.bodyText2),
          FontRow('subtitle1', tt.subtitle1),
          FontRow('subtitle2', tt.subtitle2),
          FontRow('caption', tt.caption),
          FontRow('button', tt.button),
          FontRow('overline', tt.overline),
          FontRow('headline1', tt.headline1),
          FontRow('headline2', tt.headline2),
          FontRow('headline3', tt.headline3),
          FontRow('headline4', tt.headline4),
          FontRow('headline5', tt.headline5),
          FontRow('headline6', tt.headline6),
        ],
      ),
    );
  }
}

class FontRow extends StatelessWidget {
  final String name;
  final TextStyle style;

  const FontRow(this.name, this.style, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(name, style: style)),
        InfoButton(textStyle: style),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}

class InfoButton extends StatelessWidget {
  final TextStyle textStyle;

  const InfoButton({Key key, @required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info_outline),
      onPressed: () {
        final snackBar = SnackBar(content: Text(textStyle.toString()));
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class MaterialComponentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Raised buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(child: Text('Active'), onPressed: () {}),
                const SizedBox(width: 16),
                RaisedButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Flat buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(child: Text('Active'), onPressed: () {}),
                SizedBox(width: 16),
                FlatButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Outline buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(child: Text('Active'), onPressed: () {}),
                SizedBox(width: 16),
                OutlineButton(child: Text('Disabled'), onPressed: null),
              ],
            ),
            const SizedBox(height: 16),
            Text('Floating action buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: Text('A'),
                  onPressed: () {},
                  heroTag: null,
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  child: Text('D'),
                  onPressed: null,
                  heroTag: null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Textfields'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Underline textfield',
                hintText: 'Some hint',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Underline disabled textfield',
                hintText: 'Some hint',
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Filled underline textfield',
                hintText: 'Some hint',
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Filled underline disabled textfield',
                hintText: 'Some hint',
                filled: true,
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline textfield',
                hintText: 'Some hint',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline disabled textfield',
                hintText: 'Some hint',
                border: OutlineInputBorder(),
              ),
              enabled: false,
            ),
            const SizedBox(height: 16),
            Text('App Bar'),
            const SizedBox(height: 4),
            AppBar(title: Text('AppBar')),
            const SizedBox(height: 16),
            Text('Bottom navigation Bar'),
            const SizedBox(height: 4),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 1')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 2')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), title: Text('Page 3')),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('== Defined colors =='),
          ColorItem(color: AppTheme().methodBlack(), name: 'methodBlack'),
          ColorItem(color: AppTheme.staticConstWhite, name: 'staticConstWhite'),
          ColorItem(color: AppTheme.staticFinalWhite, name: 'staticFinalWhite'),
          ColorItem(color: AppTheme.staticVarWhite, name: 'staticVarWhite'),
          ColorItem(color: AppTheme().finalWhite, name: 'finalWhite'),
          ColorItem(color: AppTheme().colorWhite, name: 'colorWhite'),
          ColorItem(color: AppTheme().getterBlack, name: 'getterBlack'),
          Text('== ThemeData Colors =='),
          ColorItem(color: themeData.primaryColor, name: 'Primary'),
          ColorItem(color: themeData.primaryColorLight, name: 'Primary light'),
          ColorItem(color: themeData.primaryColorDark, name: 'Primary dark'),
          ColorItem(color: themeData.canvasColor, name: 'Canvas'),
          ColorItem(color: themeData.accentColor, name: 'Accent'),
          ColorItem(
              color: themeData.scaffoldBackgroundColor,
              name: 'Scaffold background'),
          ColorItem(color: themeData.bottomAppBarColor, name: 'Bottom appbar'),
          ColorItem(color: themeData.cardColor, name: 'Card'),
          ColorItem(color: themeData.dividerColor, name: 'Divider'),
          ColorItem(color: themeData.focusColor, name: 'Focus'),
          ColorItem(color: themeData.hoverColor, name: 'Hover'),
          ColorItem(color: themeData.highlightColor, name: 'Highlight'),
          ColorItem(color: themeData.splashColor, name: 'Splash'),
          ColorItem(color: themeData.disabledColor, name: 'Disabled'),
          ColorItem(color: themeData.buttonColor, name: 'Button'),
          ColorItem(
              color: themeData.textSelectionColor, name: 'Text selection'),
          ColorItem(color: themeData.cursorColor, name: 'Cursor'),
          ColorItem(
              color: themeData.textSelectionHandleColor,
              name: 'Text selection handle'),
          ColorItem(color: themeData.backgroundColor, name: 'Background'),
          ColorItem(
              color: themeData.dialogBackgroundColor,
              name: 'Dialog background'),
          ColorItem(color: themeData.indicatorColor, name: 'Indicator'),
          ColorItem(color: themeData.hintColor, name: 'Hint'),
          ColorItem(color: themeData.errorColor, name: 'Error'),
          ColorItem(
              color: themeData.toggleableActiveColor,
              name: 'Toggleable Active'),
          Text('== Material Color Scheme =='),
          ColorItem(color: colorScheme.primary, name: 'Primary'),
          ColorItem(color: colorScheme.primaryVariant, name: 'Primary variant'),
          ColorItem(color: colorScheme.secondary, name: 'Secondary'),
          ColorItem(
              color: colorScheme.secondaryVariant, name: 'Secondary variant'),
          ColorItem(color: colorScheme.background, name: 'Background'),
          ColorItem(color: colorScheme.surface, name: 'Surface'),
          ColorItem(color: colorScheme.error, name: 'Error'),
          ColorItem(color: colorScheme.onPrimary, name: 'On primary'),
          ColorItem(color: colorScheme.onSecondary, name: 'On secondary'),
          ColorItem(color: colorScheme.onBackground, name: 'On background'),
          ColorItem(color: colorScheme.onSurface, name: 'On surface'),
          ColorItem(color: colorScheme.onError, name: 'On error'),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final String name;

  const ColorItem({Key key, @required this.color, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color),
      title: Text(name),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('(${color.red}, ${color.green}, ${color.blue})'),
          Text('#${_hex(color.red)}${_hex(color.green)}${_hex(color.blue)}'),
          Text('Opacity: ${(color.opacity * 100).round()}%'),
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

final otherConfigs = <PageConfig>[
  PageConfig('CustomFab', '/CustomFab', (_) => CustomFabPage()),
];

class CustomFabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomFab(onPressed: null),
          CustomFab(
            onPressed: dummyOnPressed,
          ),
          CustomFab(onPressed: dummyOnPressed, iconData: Icons.people),
        ],
      ),
    );
  }
}
