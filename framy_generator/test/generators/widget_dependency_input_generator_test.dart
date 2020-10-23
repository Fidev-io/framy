import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/widget_dependency_input_generator.dart';
import 'package:test/test.dart';

void main() {
  group('generateWidgetDependencyInput result', () {
    test('should contain null-safe String initialValue', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('initialValue: dependency.value?.toString()'),
          isTrue);
    });

    test('should have _onValueChanged method', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('void _onValueChanged('), isTrue);
    });

    test('should have lastCustomValue assignment', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('.lastCustomValue = '), isTrue);
    });

    test('should contain class FramyWidgetDependencyInput', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('class FramyWidgetDependencyInput'), isTrue);
    });

    test('should contain input key concatenation', () {
      final result = generateWidgetDependencyInput([]);
      expect(
          result
              .contains('Key(\'framy_dependency_\${dependency.name}_input\')'),
          isTrue);
    });

    test('should contain dependency.name', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('dependency.name'), isTrue);
    });

    test('should contain onChanged invocation', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('onChanged('), isTrue);
    });

    test('should contain 2 checks for type int', () {
      final result = generateWidgetDependencyInput([]);
      expect('dependency.type == \'int\''.allMatches(result), hasLength(3));
    });

    test('should contain 1 check for type String', () {
      final result = generateWidgetDependencyInput([]);
      expect('dependency.type == \'String\''.allMatches(result), hasLength(1));
    });

    test('should contain validator', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('validator'), isTrue);
    });

    test('should contain autovalidateMode', () {
      final result = generateWidgetDependencyInput([]);
      expect(
          result.contains('autovalidateMode: AutovalidateMode.always'), isTrue);
    });

    test('should contain error message Invalid integer value', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('\'Invalid integer value\''), isTrue);
    });

    test('should contain 2 checks for type double', () {
      final result = generateWidgetDependencyInput([]);
      expect('dependency.type == \'double\''.allMatches(result), hasLength(3));
    });

    test('should contain error message Invalid double value', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('\'Invalid double value\''), isTrue);
    });

    test('should contain check for type bool', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('dependency.type == \'bool\''), isTrue);
    });

    test('should contain DropdownButton<bool>', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('DropdownButton<bool>'), isTrue);
    });

    test('should contain TextFormField', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('TextFormField'), isTrue);
    });

    test('should contain Not supported type text', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('\'Not supported type\''), isTrue);
    });

    test('should contain class FramyModelInput', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('class FramyModelInput'), isTrue);
    });

    group('when there is a model object', () {
      final framyModelObjects = [
        FramyObject()
          ..name = 'User'
          ..type = FramyObjectType.model
          ..constructors = [FramyObjectConstructor('', [])],
      ];

      test('should generate else if statement', () {
        final result = generateWidgetDependencyInput(framyModelObjects);
        expect(
            result.contains('else if (dependency.type == \'User\')'), isTrue);
      });

      test('should ignore enumModel objects', () {
        //given
        final models = [
          FramyObject()
            ..name = 'User'
            ..type = FramyObjectType.model
            ..constructors = [FramyObjectConstructor('', [])],
          FramyObject()
            ..name = 'WeightUnit'
            ..type = FramyObjectType.enumModel
            ..constructors = [FramyObjectConstructor('', [])],
        ];
        //when
        final result = generateWidgetDependencyInput(models);
        //then
        expect(
            result.contains('else if (dependency.type == \'User\')'), isTrue);
        expect(result.contains('WeightUnit'), isFalse);
      });

      test('should generate 2 else if conditions when two models are passed',
          () {
        //given
        final models = [
          FramyObject()
            ..name = 'User'
            ..type = FramyObjectType.model
            ..constructors = [FramyObjectConstructor('', [])],
          FramyObject()
            ..name = 'Address'
            ..type = FramyObjectType.model
            ..constructors = [FramyObjectConstructor('', [])],
        ];
        //when
        final result = generateWidgetDependencyInput(models);
        //then
        expect(
            result.contains(
                'else if (dependency.type == \'User\' || dependency.type == \'Address\')'),
            isTrue);
      });

      test('should use FramyModelInput', () {
        final result = generateWidgetDependencyInput(framyModelObjects);
        expect(result.contains('FramyModelInput('), isTrue);
      });
    });

    test('should contain FramyPresetDropdown', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('FramyPresetDropdown'), isTrue);
    });

    test('should contain check for list', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('else if (dependency.type.startsWith(\'List<\'))'),
          isTrue);
    });

    test('should contain FramyWidgetListDependencyInput', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('FramyWidgetListDependencyInput'), isTrue);
    });

    test('should contain framyEnumMap reference', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('framyEnumMap'), isTrue);
    });

    test('should contain FramyDateTimeDependencyInput', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('FramyDateTimeDependencyInput'), isTrue);
    });

    test('should contain FramyConstructorDropdown', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('FramyConstructorDropdown'), isTrue);
    });

    test('should contain check for isFunction', () {
      final result = generateWidgetDependencyInput([]);
      expect(result.contains('else if (dependency.isFunction)'), isTrue);
    });
  });
}
