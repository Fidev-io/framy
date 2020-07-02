import 'package:framy_generator/generator/bottom_navigation_bar_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('BottomNavigationBar generator test', () {
    test('should contain class FramyBottomNavigationBarPage', (){
      String result = generateBottomNavigationBarPage();
      expect(result.contains('class FramyBottomNavigationBarPage'), isTrue);
    });

    test('should contain proper key', (){
      String result = generateBottomNavigationBarPage();
      expect(result.contains('Key(\'FramyBottomNavigationBarPage\''), isTrue);
    });
  });
}