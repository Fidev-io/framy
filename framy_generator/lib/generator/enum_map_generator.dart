import 'package:framy_generator/framy_object.dart';

String generateEnumMap(List<FramyObject> modelObjects) {
  final enumNames = <String>{'MaterialTapTargetSize'};
  enumNames.addAll(modelObjects
      .where((o) => o.type == FramyObjectType.enumModel)
      .map((fo) => fo.name));

  return '''final framyEnumMap = <String, List<dynamic>>{
  ${enumNames.fold('', (prev, enumName) => prev + _enumNameToMapEntry(enumName))}
};''';
}

String _enumNameToMapEntry(String enumName) =>
    '\'$enumName\': $enumName.values,\n';
