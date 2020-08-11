import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/framy_app_generator.dart';

String generateTestUtils(List<FramyObject> themeObjects) => '''
extension on WidgetTester {
  Future<void> pumpWrappedWidget(Widget child) => pumpWidget(
        MaterialApp(
          ${generateThemeDataLine(themeObjects)}
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: child,
          ),
        ),
      );
}

/// This is hacky as hell, but it seems to work :)
/// It gets the Roboto font from package directory.
/// If it causes problem for you, please let us know at https://github.com/fidev-io/framy/issues
Future<ByteData> loadRobotoFont() async {
  final isInTestDir = Directory.current.absolute.path.endsWith('/test');
  var packagesInfoPath = '.packages';
  if (isInTestDir) {
    packagesInfoPath = '../\$packagesInfoPath';
  }
  final packagesInfo = File(packagesInfoPath).readAsLinesSync();
  var generatorUri = packagesInfo
      .singleWhere((element) => element.startsWith('framy_generator'))
      .substring(16);
  if (generatorUri.startsWith('file://')) {
    generatorUri = generatorUri.substring(7);
  }
  if (isInTestDir && generatorUri.contains('\.\.')) {
    generatorUri = generatorUri.replaceFirst('\.\.', '\.\./\.\.');
  }
  final robotoFont = File('\${generatorUri}fonts/Roboto.ttf');
  final bytes = await robotoFont.readAsBytes();
  return ByteData.view(bytes.buffer);
}
''';
