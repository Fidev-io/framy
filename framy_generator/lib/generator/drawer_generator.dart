import 'package:framy_generator/framy_object.dart';

String generateDrawer(List<FramyObject> widgetFramyObjects) => '''
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
                  ],
                ),
              ),
              ${_generateCustomWidgetTiles(widgetFramyObjects)}
            ],
          ),
        ),
      ),
    );
  }
}
''';
String _generateCustomWidgetTiles(List<FramyObject> widgetObjects) {
  String result = '';
  widgetObjects
      .where((framyObject) => framyObject.type == FramyObjectType.widget)
      .forEach(
    (widgetFramyObject) {
      result += '''
ListTile(
  leading: SizedBox.shrink(),
  title: Text('${widgetFramyObject.name}'),
),
''';
    },
  );
  return result;
}
