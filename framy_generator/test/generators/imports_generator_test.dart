import 'package:framy_generator/generator/imports_generator.dart';
import 'package:test/test.dart';

void main() {
  group('imports generator result', () {
    test('should import material', () {
      //when
      final String result = generateImports();
      //then
      expect(result.contains('import \'package:flutter/material.dart\';\n'),
          isTrue);
    });

    test('should import foundation', () {
      //when
      final String result = generateImports();
      //then
      expect(result.contains('import \'package:flutter/foundation.dart\';\n'),
          isTrue);
    });
  });
}
