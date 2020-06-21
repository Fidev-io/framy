import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/presets_map_generator.dart';
import 'package:test/test.dart';

void main() {
  group('preset map generator result', () {
    test('should return empty map when no presets are passed', () {
      final result = generatePresets([]);
      expect(result,
          'Map<String, Map<String, dynamic>> createFramyPresets() => {};');
    });

    test('should return one preset if passed', () {
      final result = generatePresets([
        FramyObject()
          ..type = FramyObjectType.preset
          ..name = 'presetName'
          ..kind = ElementKind.FUNCTION
          ..isStatic = true
          ..returnType = 'User'
      ]);
      expect(result,
          "Map<String, Map<String, dynamic>> createFramyPresets() => {'User': {'presetName': presetName(),},};");
    });

    test('should handle two presets for same type', () {
      final result = generatePresets([
        FramyObject()
          ..type = FramyObjectType.preset
          ..name = 'presetName'
          ..kind = ElementKind.FUNCTION
          ..isStatic = true
          ..returnType = 'User',
        FramyObject()
          ..type = FramyObjectType.preset
          ..name = 'presetName2'
          ..kind = ElementKind.FUNCTION
          ..isStatic = true
          ..returnType = 'User',
      ]);
      expect(result,
          "Map<String, Map<String, dynamic>> createFramyPresets() => {'User': {'presetName': presetName(),'presetName2': presetName2(),},};");
    });

    test('should handle two presets for different types', () {
      final result = generatePresets([
        FramyObject()
          ..type = FramyObjectType.preset
          ..name = 'presetName'
          ..kind = ElementKind.FUNCTION
          ..isStatic = true
          ..returnType = 'User',
        FramyObject()
          ..type = FramyObjectType.preset
          ..name = 'usAddress'
          ..kind = ElementKind.FUNCTION
          ..isStatic = true
          ..returnType = 'Address',
      ]);
      expect(result,
          "Map<String, Map<String, dynamic>> createFramyPresets() => {'User': {'presetName': presetName(),},'Address': {'usAddress': usAddress(),},};");
    });
  });
}
