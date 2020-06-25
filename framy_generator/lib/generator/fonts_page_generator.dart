String generateFontsPage() => '''
class FramyFontsPage extends StatelessWidget {
  const FramyFontsPage() : super(key: const Key('FramyFontsPage'));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
    final size = ' / size: \${style.fontSize.toStringAsFixed(1)}';
    final weight =
        ' / weight: \${style.fontWeight.toString().replaceAll('FontWeight.', '')}';
    final height = style.height == null ? '' : ' / height: \${style.height}';
    final letterSpacing = style.letterSpacing == null
        ? ''
        : ' / letter spacing: \${style.letterSpacing}';
    final wordSpacing = style.wordSpacing == null
        ? ''
        : ' / word spacing: \${style.wordSpacing}';
    final color =
        ' / color: #\${_hex(style.color.alpha)}\${_hex(style.color.red)}\${_hex(style.color.green)}\${_hex(style.color.blue)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style),
          Text(
            '\$family\$size\$weight\$color\$height\$letterSpacing\$wordSpacing',
          ),
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}
''';
