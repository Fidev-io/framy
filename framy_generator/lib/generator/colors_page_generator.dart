String generateColorsPage() => '''
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
                  '#\${_hex(color.alpha)}\${_hex(color.red)}\${_hex(color.green)}\${_hex(color.blue)}',
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
''';
//import 'package:framy_generator/framy_object.dart';
//import 'package:framy_generator/generator/accessible_element_generator.dart';
//
//String generateColorsPage(List<FramyObject> colors) => '''
//class ColorsPage extends StatelessWidget {
//
//  const ColorsPage({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final themeData = Theme.of(context);
//    final colorScheme = themeData.colorScheme;
//    return SingleChildScrollView(
//      child: Column(
//        children: [
//          ${_objectsToColorItems(colors)}
//          Text('== ThemeData Colors =='),
//          ColorItem(color: themeData.primaryColor, name: 'Primary'),
//          ColorItem(color: themeData.primaryColorLight, name: 'Primary light'),
//          ColorItem(color: themeData.primaryColorDark, name: 'Primary dark'),
//          ColorItem(color: themeData.canvasColor, name: 'Canvas'),
//          ColorItem(color: themeData.accentColor, name: 'Accent'),
//          ColorItem(
//              color: themeData.scaffoldBackgroundColor,
//              name: 'Scaffold background'),
//          ColorItem(color: themeData.bottomAppBarColor, name: 'Bottom appbar'),
//          ColorItem(color: themeData.cardColor, name: 'Card'),
//          ColorItem(color: themeData.dividerColor, name: 'Divider'),
//          ColorItem(color: themeData.focusColor, name: 'Focus'),
//          ColorItem(color: themeData.hoverColor, name: 'Hover'),
//          ColorItem(color: themeData.highlightColor, name: 'Highlight'),
//          ColorItem(color: themeData.splashColor, name: 'Splash'),
//          ColorItem(color: themeData.disabledColor, name: 'Disabled'),
//          ColorItem(color: themeData.buttonColor, name: 'Button'),
//          ColorItem(
//              color: themeData.textSelectionColor, name: 'Text selection'),
//          ColorItem(color: themeData.cursorColor, name: 'Cursor'),
//          ColorItem(
//              color: themeData.textSelectionHandleColor,
//              name: 'Text selection handle'),
//          ColorItem(color: themeData.backgroundColor, name: 'Background'),
//          ColorItem(
//              color: themeData.dialogBackgroundColor,
//              name: 'Dialog background'),
//          ColorItem(color: themeData.indicatorColor, name: 'Indicator'),
//          ColorItem(color: themeData.hintColor, name: 'Hint'),
//          ColorItem(color: themeData.errorColor, name: 'Error'),
//          ColorItem(
//              color: themeData.toggleableActiveColor,
//              name: 'Toggleable Active'),
//          Text('== Material Color Scheme =='),
//          ColorItem(color: colorScheme.primary, name: 'Primary'),
//          ColorItem(color: colorScheme.primaryVariant, name: 'Primary variant'),
//          ColorItem(color: colorScheme.secondary, name: 'Secondary'),
//          ColorItem(
//              color: colorScheme.secondaryVariant, name: 'Secondary variant'),
//          ColorItem(color: colorScheme.background, name: 'Background'),
//          ColorItem(color: colorScheme.surface, name: 'Surface'),
//          ColorItem(color: colorScheme.error, name: 'Error'),
//          ColorItem(color: colorScheme.onPrimary, name: 'On primary'),
//          ColorItem(color: colorScheme.onSecondary, name: 'On secondary'),
//          ColorItem(color: colorScheme.onBackground, name: 'On background'),
//          ColorItem(color: colorScheme.onSurface, name: 'On surface'),
//          ColorItem(color: colorScheme.onError, name: 'On error'),
//        ],
//      ),
//    );
//  }
//}
//
//class ColorItem extends StatelessWidget {
//  final Color color;
//  final String name;
//
//  const ColorItem({Key key, @required this.color, @required this.name})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return ListTile(
//      leading: CircleAvatar(backgroundColor: color),
//      title: Text(name),
//      trailing: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//          Text('(\${color.red}, \${color.green}, \${color.blue})'),
//          Text('#\${_hex(color.red)}\${_hex(color.green)}\${_hex(color.blue)}'),
//          Text('Opacity: \${(color.opacity * 100).round()}%'),
//        ],
//      ),
//    );
//  }
//
//  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
//}
//
//''';
//
//String _objectsToColorItems(List<FramyObject> colors) {
//  if (colors.isEmpty) {
//    return '';
//  } else {
//    String result = 'Text(\'== Defined colors ==\'),\n';
//    result = colors.fold(result, (prev, obj) {
//      String colorItem = '          ColorItem(color: ';
//      colorItem += generateAccessibleElement(obj);
//      colorItem += ', name: \'${obj.name}\'),\n';
//      return prev + colorItem;
//    });
//    return result;
//  }
//}
