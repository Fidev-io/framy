import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/test_generator/generate_tests.dart';
import 'package:test/test.dart';

void main() {
  group('generate tests result', () {
    test('should conain main()', () {
      final result = generateTests([], []);
      expect(result.contains('void main()'), isTrue);
    });

    test('should contain widgetBinding with iPhone 11 setup', () {
      final result = generateTests([], []);
      expect(
        result.contains(
            'final binding = TestWidgetsFlutterBinding.ensureInitialized();'),
        isTrue,
      );
      expect(
        result.contains(' ..physicalSizeTestValue = Size(414, 896)'),
        isTrue,
      );
      expect(
        result.contains('..devicePixelRatioTestValue = 1.0'),
        isTrue,
      );
    });

    test('should contain font loader', () {
      final result = generateTests([], []);
      expect(result.contains('''
  var fontLoader = FontLoader('Roboto');
  fontLoader.addFont(loadRobotoFont());
  await fontLoader.load();
'''), isTrue);
    });

    group('when widgets are passed', () {
      final fooObject = FramyObject()
        ..name = 'Foo'
        ..constructors = [
          FramyObjectConstructor('', [
            FramyObjectDependency('bar', 'Bar', 'null', false),
          ])
        ];

      test('should contain group for a widget name', () {
        final result = generateTests([fooObject], []);
        expect(result.contains('group(\'Foo\','), isTrue);
      });

      test('should contain default test', () {
        final result = generateTests([fooObject], []);
        expect(result.contains('testWidgets(\'default\','), isTrue);
      });

      test('should contain proper matchesGoldenFile name', () {
        final result = generateTests([fooObject], []);
        expect(
            result.contains('matchesGoldenFile(\'goldens/Foo_default.png\')'),
            isTrue);
      });

      test('should not contain presets', () {
        final result = generateTests([fooObject], []);
        expect(result.contains('createFramyPresets'), isFalse);
      });

      test('should contain presets when they are passed', () {
        final presetObject = FramyObject()
          ..type = FramyObjectType.preset
          ..returnType = 'Bar';
        final result = generateTests([fooObject], [presetObject]);
        expect(result.contains('createFramyPresets()'), isTrue);
      });
    });
  });
}
