import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generatePresets(List<FramyObject> presets) {
  final Map<String, List<FramyObject>> presetsByType = {};
  presets.forEach((element) {
    if (presetsByType.containsKey(element.returnType)) {
      presetsByType[element.returnType].add(element);
    } else {
      presetsByType[element.returnType] = [element];
    }
  });

  final presetsString = presetsByType.entries.fold(
      '', (p, entry) => p + _generatePresetsForType(entry.key, entry.value));

  return 'Map<String, Map<String, dynamic>> createFramyPresets() => {$presetsString};';
}

String _generatePresetsForType(String type, List<FramyObject> presets) {
  return '\'$type\': {${presets.fold('', (p, presetObject) => p + '\'${presetObject.name}\': ${generateAccessibleElement(presetObject)},')}},';
}
