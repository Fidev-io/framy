// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FramyApp());
}

class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      home: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice = constraints.maxWidth < 1000;
          return Scaffold(
            appBar: FramyAppBar(),
            body: FramyFontsPage(),
            drawer: isSmallDevice ? FramyDrawer() : null,
          );
        },
      ),
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
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Color scheme'),
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
