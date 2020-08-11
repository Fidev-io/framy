// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:pedantic/pedantic.dart';
import 'package:source_gen/source_gen.dart';

/// A [Builder] wrapping on one or more [Generator]s.
class _Builder extends Builder {
  /// Function that determines how the generated code is formatted.
  final String Function(String) formatOutput;

  /// The generators run for each targeted library.
  final List<Generator> _generators;

  /// The [buildExtensions] configuration for `.dart`
  final String _generatedExtension;

  /// Whether to emit a standalone (non-`part`) file in this builder.
  bool get _isLibraryBuilder => this is LibraryBuilder;

  final String _header;

  @override
  final Map<String, List<String>> buildExtensions;

  /// Wrap [_generators] to form a [Builder]-compatible API.
  _Builder(
    this._generators, {
    String Function(String code) formatOutput,
    String generatedExtension = '.g.dart',
    List<String> additionalOutputExtensions = const [],
    String header,
  })  : _generatedExtension = generatedExtension,
        buildExtensions = {
          '.dart': [
            generatedExtension,
            ...additionalOutputExtensions,
          ]
        },
        formatOutput = formatOutput,
        _header = (header ?? defaultFileHeader).trim() {
    if (_generatedExtension == null) {
      throw ArgumentError.notNull('generatedExtension');
    }
    if (_generatedExtension.isEmpty || !_generatedExtension.startsWith('.')) {
      throw ArgumentError.value(_generatedExtension, 'generatedExtension',
          'Extension must be in the format of .*');
    }
    if (_isLibraryBuilder && _generators.length > 1) {
      throw ArgumentError(
          'A standalone file can only be generated from a single Generator.');
    }
  }

  @override
  Future build(BuildStep buildStep) async {
    print('inside this build');
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final lib = await buildStep.inputLibrary;
    await _generateForLibrary(lib, buildStep);
  }

  Future _generateForLibrary(
    LibraryElement library,
    BuildStep buildStep,
  ) async {
    final generatedOutputs =
        await _generate(library, _generators, buildStep).toList();
    print('print got generated outputs: ${generatedOutputs.length}');

    // Don't output useless files.
    //
    // NOTE: It is important to do this check _before_ checking for valid
    // library/part definitions because users expect some files to be skipped
    // therefore they do not have "library".
    if (generatedOutputs.isEmpty) return;
    final outputId = buildStep.inputId.changeExtension(_generatedExtension);

    final contentBuffer = StringBuffer();

    if (_header.isNotEmpty) {
      contentBuffer.writeln(_header);
    }

    for (var item in generatedOutputs) {
      contentBuffer.writeln(item.output);
    }

    var genPartContent = contentBuffer.toString();

    try {
      genPartContent = formatOutput(genPartContent);
    } catch (e, stack) {
      log.severe(
          'Error formatting generated source code for ${library.identifier} '
          'which was output to ${outputId.path}.\n'
          'This may indicate an issue in the generated code or in the '
          'formatter.\n'
          'Please check the generated code and file an issue on source_gen if '
          'appropriate.',
          e,
          stack);
    }

    print('writing...');
    unawaited(buildStep.writeAsString(outputId, genPartContent));
  }

  @override
  String toString() =>
      'Generating $_generatedExtension: ${_generators.join(', ')}';
}

class JsonLibraryBuilder extends _Builder {
  JsonLibraryBuilder(
    Generator generator, {
    String Function(String code) formatOutput,
    String generatedExtension = '.g.dart',
    List<String> additionalOutputExtensions = const [],
    String header,
  }) : super(
          [generator],
          formatOutput: formatOutput,
          generatedExtension: generatedExtension,
          additionalOutputExtensions: additionalOutputExtensions,
          header: header,
        );
}

Stream<GeneratedOutput> _generate(
  LibraryElement library,
  List<Generator> generators,
  BuildStep buildStep,
) async* {
  final libraryReader = LibraryReader(library);
  for (var i = 0; i < generators.length; i++) {
    final gen = generators[i];
    try {
      var msg = 'Running $gen';
      if (generators.length > 1) {
        msg = '$msg - ${i + 1} of ${generators.length}';
      }
      log.fine(msg);
      var createdUnit = await gen.generate(libraryReader, buildStep);

      if (createdUnit == null) {
        continue;
      }

      createdUnit = createdUnit.trim();
      if (createdUnit.isEmpty) {
        continue;
      }

      yield GeneratedOutput(gen, createdUnit);
    } catch (e, stack) {
      log.severe('Error running $gen', e, stack);
      yield GeneratedOutput.fromError(gen, e, stack);
    }
  }
}

const defaultFileHeader = '// GENERATED CODE - DO NOT MODIFY BY HAND';

const partIdRegExpLiteral = r'[A-Za-z_\d-]+';

class GeneratedOutput {
  final String output;
  final Generator generator;
  final dynamic error;
  final StackTrace stackTrace;

  bool get isError => error != null;

  GeneratedOutput(this.generator, this.output)
      : error = null,
        stackTrace = null,
        assert(output != null),
        assert(output.isNotEmpty),
        // assuming length check is cheaper than simple string equality
        assert(output.length == output.trim().length);

  GeneratedOutput.fromError(this.generator, this.error, this.stackTrace)
      : output = _outputFromError(error);

  @override
  String toString() {
    final output = generator.toString();
    if (output.endsWith('Generator')) {
      return output;
    }
    return 'Generator: $output';
  }
}

String _outputFromError(Object error) {
  final buffer = StringBuffer();

  _commentWithHeader(_errorHeader, error.toString(), buffer);

  if (error is InvalidGenerationSourceError && error.todo.isNotEmpty) {
    _commentWithHeader(_todoHeader, error.todo, buffer);
  }

  return buffer.toString();
}

void _commentWithHeader(String header, String content, StringSink buffer) {
  final lines = const LineSplitter().convert(content);

  buffer
    ..writeAll([_commentPrefix, header, lines.first])
    ..writeln();

  final blankPrefix = ''.padLeft(header.length, ' ');
  for (var i = 1; i < lines.length; i++) {
    buffer
      ..writeAll([_commentPrefix, blankPrefix, lines[i]])
      ..writeln();
  }
}

const _commentPrefix = '// ';
const _errorHeader = 'Error: ';
const _todoHeader = 'TODO: ';
