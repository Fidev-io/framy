import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/utils.dart';

import 'golden_test.test.framy.dart' as golden_tests;

@FramyGoldenTests()
void main() async {
  mockDateTime = DateTime(2020, 09, 05);
  await golden_tests.main();
}
