import 'dart:convert';

import 'package:framy_generator/framy_object.dart';

String fixJson(String generatedJson) {
  return generatedJson.replaceAll('\n]\n\n[\n', ',\n');
}

extension JsonListExtension on List<FramyObject> {
  String toJson() => JsonEncoder.withIndent('  ')
      .convert(map((framyObj) => framyObj.toMap()).toList());
}
