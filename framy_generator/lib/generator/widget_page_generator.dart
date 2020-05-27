import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generateWidgetPage(List<FramyObject> widgetObjects) {
  final pageName = widgetObjects.first.page;
  return '''
class ${pageName.replaceAll(' ', '')}Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ${_getComponentConstructors(widgetObjects)}
        ],
      ),
    );
  }
}

''';
}

String _getComponentConstructors(List<FramyObject> componentObjects) {
  return componentObjects.fold(
    '',
    (prev, co) => '$prev${_getConstructor(co)},\n',
  );
}

String _getConstructor(FramyObject object) {
  if (object.constructor != null) {
    return object.constructor;
  } else if (object.parentObject != null) {
    return generateAccessibleElement(object);
  } else {
    print(
        'No constructor, nor parent object for ${object.name}. Adding SizedBox()...');
    return 'SizedBox.shrink()';
  }
}
