import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/resolvers/theme_data_resolver.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  group('ThemeDataResolver', () {
    AnnotatedElementMock annotatedElement;
    ElementMock element;
    LibraryElementMock library;
    setUp(() {
      annotatedElement = AnnotatedElementMock();
      element = ElementMock();
      library = LibraryElementMock();
      when(annotatedElement.element).thenReturn(element);
      when(element.library).thenReturn(library);
      when(library.importedLibraries).thenReturn([]);
    });

    test('sets themeData objectType', () {
      final object = resolveThemeData(annotatedElement);
      expect(object.type, FramyObjectType.themeData);
    });
  });
}
