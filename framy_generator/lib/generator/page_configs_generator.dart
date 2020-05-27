import 'package:framy_generator/framy_object.dart';

String generatePageConfigs(List<FramyObject> allObjects) {
  final pages = allObjects.map((obj) => obj.page).toSet()..remove(null);
  final pagesStr = pages.fold(
      '',
      (prev, page) =>
          '${prev}PageConfig(\'$page\', \'/$page\', (_) => ${page.replaceAll(' ', '')}Page()),\n');
  String otherConfigsStr = '''
final otherConfigs = <PageConfig>[
  $pagesStr
];
''';
  return otherConfigsStr;
}
