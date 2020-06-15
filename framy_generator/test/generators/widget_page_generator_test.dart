import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_page_generator.dart';
import 'package:test/test.dart';

void main() {
  group('Widget page generator result', () {
    test('should not generate anything when no widgets passed', () {
      final result = generateWidgetPages([]);
      expect(result, isEmpty);
    });

    group('when a widget is passed', () {
      test('should have a class with name FramyXXXCustomPage', () {
        //given
        final widgetObjects = [
          FramyObject()
            ..name = 'MyWidget'
            ..type = FramyObjectType.widget
        ];
        //when
        final result = generateWidgetPages(widgetObjects);
        //then
        expect(result.contains('class FramyMyWidgetCustomPage'), isTrue);
      });

      test('should contain key Framy_XXX_Page', () {
        //given
        final widgetObjects = [
          FramyObject()
            ..name = 'MyWidget'
            ..type = FramyObjectType.widget
        ];
        //when
        final result = generateWidgetPages(widgetObjects);
        //then
        expect(result.contains('Framy_MyWidget_Page'), isTrue);
      });

      test('should contain custom widget XXX constructor', () {
        //given
        final widgetObjects = [
          FramyObject()
            ..name = 'MyWidget'
            ..type = FramyObjectType.widget
        ];
        //when
        final result = generateWidgetPages(widgetObjects);
        //then
        expect(result.contains('MyWidget('), isTrue);
      });
    });

    test('should contain 2 classes with proper names when 2 widgets are passed',
        () {
      //given
      final widgetObjects = [
        FramyObject()
          ..name = 'Widget1'
          ..type = FramyObjectType.widget,
        FramyObject()
          ..name = 'Widget2'
          ..type = FramyObjectType.widget,
      ];
      //when
      final result = generateWidgetPages(widgetObjects);
      //then
      expect(result.contains('FramyWidget1CustomPage'), isTrue);
      expect(result.contains('FramyWidget2CustomPage'), isTrue);
    });
  });
}
