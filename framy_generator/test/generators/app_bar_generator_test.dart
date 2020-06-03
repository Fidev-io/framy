import 'package:framy_generator/generator/app_bar_generator.dart';
import 'package:test/test.dart';

void main() {
  group('AppBar Generator result', () {
    test('should generate FramyAppBar', () {
      //when
      final String result = generateAppBar();
      //then
      final expectedResult = '''
class FramyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
    );
  }
}
''';
      expect(result, equals(expectedResult));
    });
  });
}
