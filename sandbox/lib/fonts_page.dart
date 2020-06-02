import 'package:flutter/material.dart';

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FontRow('bodyTexssst1', tt.bodyText1),
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
