import 'package:analyzer/src/generated/source.dart';
import 'package:framy_generator/framy_object.dart';
import 'package:mockito/mockito.dart';
import 'package:source_gen/source_gen.dart';

class ElementMock extends Mock implements Element {}

class LibraryElementMock extends Mock implements LibraryElement {}

class FieldElementMock extends Mock implements FieldElement {}

class ExecutableElementMock extends Mock implements ExecutableElement {}

class AnnotatedElementMock extends Mock implements AnnotatedElement {}

class ElementLocationMock extends Mock implements ElementLocation {}

class SourceMock extends Mock implements Source {}
