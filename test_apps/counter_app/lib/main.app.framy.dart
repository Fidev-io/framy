// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(FramyApp());
}

class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: FramyAppBar(),
        body: FramyFontsPage(),
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
    return Text(label, style: style);
  }
}
