void main() {
//  group('FramyObject', () {
//    group('FromElement constructor', () {
//      ElementMock element;
//      LibraryElementMock library;
//      setUp(() {
//        element = ElementMock();
//        library = LibraryElementMock();
//        when(element.library).thenReturn(library);
//        when(library.importedLibraries).thenReturn([]);
//      });
//
//      test('has proper name', () {
//        when(element.displayName).thenReturn('Foo');
//        final framyObject = FramyObject.fromElement(element);
//        expect(framyObject.name, equals('Foo'));
//      });
//
//      test('has proper kind', () {
//        when(element.kind).thenReturn(ElementKind.CLASS);
//        final framyObject = FramyObject.fromElement(element);
//        expect(framyObject.kind, equals(ElementKind.CLASS));
//      });
//
//      test('has proper import', () {
//        final source = SourceMock();
//        when(source.isInSystemLibrary).thenReturn(false);
//        when(source.uri).thenReturn(Uri.parse('package:foo/foo.dart'));
//        when(element.librarySource).thenReturn(source);
//        final framyObject = FramyObject.fromElement(element);
//        expect(framyObject.import, equals('package:foo/foo.dart'));
//      });
//
//      group('isStatic', () {
//        test('is true for static ExecutableElement', () {
//          final execElement = ExecutableElementMock();
//          when(execElement.library).thenReturn(library);
//          when(execElement.isStatic).thenReturn(true);
//          final framyObject = FramyObject.fromElement(execElement);
//          expect(framyObject.isStatic, isTrue);
//        });
//
//        test('is false for non-static ExecutableElement', () {
//          final execElement = ExecutableElementMock();
//          when(execElement.library).thenReturn(library);
//          when(execElement.isStatic).thenReturn(false);
//          final framyObject = FramyObject.fromElement(execElement);
//          expect(framyObject.isStatic, isFalse);
//        });
//
//        test('is true for static FieldElement', () {
//          final fieldElement = FieldElementMock();
//          when(fieldElement.library).thenReturn(library);
//          when(fieldElement.isStatic).thenReturn(true);
//          final framyObject = FramyObject.fromElement(fieldElement);
//          expect(framyObject.isStatic, isTrue);
//        });
//
//        test('is false for non-static FieldElement', () {
//          final fieldElement = FieldElementMock();
//          when(fieldElement.library).thenReturn(library);
//          when(fieldElement.isStatic).thenReturn(false);
//          final framyObject = FramyObject.fromElement(fieldElement);
//          expect(framyObject.isStatic, isFalse);
//        });
//      });
//
//      test('maps dependency imports', () {
//        final importedLibraries = [LibraryElementMock(), LibraryElementMock()]
//          ..forEach(
//              (lib) => when(lib.location).thenReturn(ElementLocationMock()));
//        when(library.importedLibraries).thenReturn(importedLibraries);
//        final framyObject = FramyObject.fromElement(element);
//        expect(framyObject.dependencyImports, hasLength(2));
//        expect(framyObject.dependencyImports[0], 'ElementLocationMock');
//        expect(framyObject.dependencyImports[1], 'ElementLocationMock');
//      });
//    });
//  });
}
