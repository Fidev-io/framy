import 'package:framy_generator/framy_object.dart';

String generateDrawer(List<FramyObject> widgetFramyObjects) => '''
class FramyDrawer extends StatelessWidget {
  final bool showHeader;

  const FramyDrawer({Key key, this.showHeader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              if (showHeader)
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Framy App'),
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
              Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.black54),
                child: ExpansionTile(
                  leading: Icon(Icons.category),
                  title: Text(
                    'Material components',
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('AppBar'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/appbar'),
                    ),
                    ListTile(
                      key: Key('MaterialComponentsButtonButton'),
                      leading: SizedBox.shrink(),
                      title: Text('Button'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/button'),
                    ),
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('Toggle'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/toggle'),
                    ),
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('TextField'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/textfield'),
                    ),
                  ],
                ),
              ),
              ${_generateCustomWidgetTiles(widgetFramyObjects)}
              ListTile(
                leading: Icon(Icons.view_carousel),
                title: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text('Storyboard'),
                    Chip(
                      label: Text(
                        'Preview',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/storyboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';

String _generateCustomWidgetTiles(List<FramyObject> objects) {
  final widgetObjects = objects
      .where((framyObject) =>
          framyObject.type == FramyObjectType.widget ||
          framyObject.type == FramyObjectType.page)
      .toList();

  final groupNames = widgetObjects.map((o) => o.widgetGroupName).toSet();

  String result = groupNames.fold(
    '',
    (prev, groupName) => prev + _generateGroupTiles(groupName, widgetObjects),
  );

  result = widgetObjects
      .where((element) => element.widgetGroupName == null)
      .toList()
      .fold(
        result,
        (prev, framyObject) => prev + _generateTile(framyObject.name),
      );
  return result;
}

String _generateGroupTiles(String groupName, List<FramyObject> widgetObjects) {
  if (groupName == null) {
    return '';
  }
  String result = '''
Theme(
  data: Theme.of(context).copyWith(accentColor: Colors.black54),
  child: ExpansionTile(
    leading: Icon(Icons.folder_open),
    title: Text(
      '$groupName',
      style: TextStyle(color: Colors.black),
    ),
    children: [
''';
  result = widgetObjects
      .where((obj) => obj.widgetGroupName == groupName)
      .toList()
      .fold(result,
          (prev, widgetObject) => prev + _generateTile(widgetObject.name));
  result += '],),),';
  return result;
}

String _generateTile(String className) => '''
ListTile(
  leading: SizedBox.shrink(),
  title: Text('$className'),
  onTap: () => Navigator.of(context).pushReplacementNamed('/$className'),
),
''';
