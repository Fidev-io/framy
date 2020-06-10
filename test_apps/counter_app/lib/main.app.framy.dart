// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/main.dart';

void main() {
  runApp(FramyApp());
}

class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      theme: getThemeData(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
  };
  final page = routes[settings.name] ?? FramyFontsPage();
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: page),
    settings: settings,
  );
}

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

class FramyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
                child: Text('Framy App'),
              ),
              ListTile(
                leading: Icon(Icons.text_fields),
                title: Text('Typography'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/typography'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Color scheme'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/colors'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FramyFontsPage extends StatelessWidget {
  const FramyFontsPage() : super(key: const Key('FramyFontsPage'));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FramySingleFontRow('Headline1', textTheme.headline1),
          FramySingleFontRow('Headline2', textTheme.headline2),
          FramySingleFontRow('Headline3', textTheme.headline3),
          FramySingleFontRow('Headline4', textTheme.headline4),
          FramySingleFontRow('Headline5', textTheme.headline5),
          FramySingleFontRow('Headline6', textTheme.headline6),
          FramySingleFontRow('Subtitle1', textTheme.subtitle1),
          FramySingleFontRow('Subtitle2', textTheme.subtitle2),
          FramySingleFontRow('BodyText1', textTheme.bodyText1),
          FramySingleFontRow('BodyText2', textTheme.bodyText2),
          FramySingleFontRow('Caption', textTheme.caption),
          FramySingleFontRow('Button', textTheme.button),
          FramySingleFontRow('Overline', textTheme.overline),
        ],
      ),
    );
  }
}

class FramySingleFontRow extends StatelessWidget {
  final String label;
  final TextStyle style;

  const FramySingleFontRow(this.label, [this.style]);

  @override
  Widget build(BuildContext context) {
    final family = style.fontFamily;
    final size = ' / size: ${style.fontSize.toStringAsFixed(1)}';
    final weight =
        ' / weight: ${style.fontWeight.toString().replaceAll('FontWeight.', '')}';
    final height = style.height == null ? '' : ' / height: ${style.height}';
    final letterSpacing = style.letterSpacing == null
        ? ''
        : ' / letter spacing: ${style.letterSpacing}';
    final wordSpacing = style.wordSpacing == null
        ? ''
        : ' / word spacing: ${style.wordSpacing}';
    final color =
        ' / color: #${_hex(style.color.alpha)}${_hex(style.color.red)}${_hex(style.color.green)}${_hex(style.color.blue)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style),
          Text(
            '$family$size$weight$color$height$letterSpacing$wordSpacing',
          ),
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

class FramyColorsPage extends StatelessWidget {
  const FramyColorsPage() : super(key: const Key('FramyColorsPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: [
        _FramyColorItem(
          name: 'Primary',
          color: Theme.of(context).primaryColor,
        ),
        _FramyColorItem(
          name: 'Primary light',
          color: Theme.of(context).primaryColorLight,
        ),
        _FramyColorItem(
          name: 'Primary dark',
          color: Theme.of(context).primaryColorDark,
        ),
        _FramyColorItem(name: 'Canvas', color: Theme.of(context).canvasColor),
        _FramyColorItem(name: 'Accent', color: Theme.of(context).accentColor),
        _FramyColorItem(
          name: 'Scaffold background',
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Bottom appbar',
          color: Theme.of(context).bottomAppBarColor,
        ),
        _FramyColorItem(name: 'Card', color: Theme.of(context).cardColor),
        _FramyColorItem(
          name: 'Divider',
          color: Theme.of(context).dividerColor,
        ),
        _FramyColorItem(name: 'Focus', color: Theme.of(context).focusColor),
        _FramyColorItem(name: 'Hover', color: Theme.of(context).hoverColor),
        _FramyColorItem(
          name: 'Highlight',
          color: Theme.of(context).highlightColor,
        ),
        _FramyColorItem(name: 'Splash', color: Theme.of(context).splashColor),
        _FramyColorItem(
          name: 'Disabled',
          color: Theme.of(context).disabledColor,
        ),
        _FramyColorItem(name: 'Button', color: Theme.of(context).buttonColor),
        _FramyColorItem(
          name: 'Text selection',
          color: Theme.of(context).textSelectionColor,
        ),
        _FramyColorItem(name: 'Cursor', color: Theme.of(context).cursorColor),
        _FramyColorItem(
          name: 'Text selection handle',
          color: Theme.of(context).textSelectionHandleColor,
        ),
        _FramyColorItem(
          name: 'Background',
          color: Theme.of(context).backgroundColor,
        ),
        _FramyColorItem(
          name: 'Dialog background',
          color: Theme.of(context).dialogBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Indicator',
          color: Theme.of(context).indicatorColor,
        ),
        _FramyColorItem(name: 'Hint', color: Theme.of(context).hintColor),
        _FramyColorItem(name: 'Error', color: Theme.of(context).errorColor),
        _FramyColorItem(
          name: 'Toggleable Active',
          color: Theme.of(context).toggleableActiveColor,
        ),
      ],
    );
  }
}

class _FramyColorItem extends StatelessWidget {
  final String name;
  final Color color;

  const _FramyColorItem({Key key, @required this.name, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 0.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  key: Key(name),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '#${_hex(color.alpha)}${_hex(color.red)}${_hex(color.green)}${_hex(color.blue)}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}
