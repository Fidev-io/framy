// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
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
        formatOutput = formatOutput ?? _formatter.format,
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

/// A [Builder] which generates content intended for `part of` files.
///
/// Generated files will be prefixed with a `partId` to ensure multiple
/// [SharedPartBuilder]s can produce non conflicting `part of` files. When the
/// `source_gen|combining_builder` is applied to the primary input these
/// snippets will be concatenated into the final `.g.dart` output.
///
/// This builder can be used when multiple generators may need to output to the
/// same part file but [PartBuilder] can't be used because the generators are
/// not all defined in the same location. As a convention most codegen which
/// generates code should use this approach to get content into a `.g.dart` file
/// instead of having individual outputs for each building package.
class SharedPartBuilder extends _Builder {
  /// Wrap [generators] as a [Builder] that generates `part of` files.
  ///
  /// [partId] indicates what files will be created for each `.dart`
  /// input. This extension should be unique as to not conflict with other
  /// [SharedPartBuilder]s. The resulting file will be of the form
  /// `<generatedExtension>.g.part`. If any generator in [generators] will
  /// create additional outputs through the [BuildStep] they should be indicated
  /// in [additionalOutputExtensions].
  ///
  /// [formatOutput] is called to format the generated code. Defaults to
  /// [DartFormatter.format].
  SharedPartBuilder(
    List<Generator> generators,
    String partId, {
    String Function(String code) formatOutput,
    List<String> additionalOutputExtensions = const [],
  }) : super(
          generators,
          formatOutput: formatOutput,
          generatedExtension: '.$partId.g.part',
          additionalOutputExtensions: additionalOutputExtensions,
          header: '',
        ) {
    if (!_partIdRegExp.hasMatch(partId)) {
      throw ArgumentError.value(
          partId,
          'partId',
          '`partId` can only contain letters, numbers, `_` and `.`. '
              'It cannot start or end with `.`.');
    }
  }
}

/// A [Builder] which generates standalone Dart library files.
///
/// A single [Generator] is responsible for generating the entirety of the
/// output since it must also output any relevant import directives at the
/// beginning of it's output.
class JsonLibraryBuilder extends _Builder {
  /// Wrap [generator] as a [Builder] that generates Dart library files.
  ///
  /// [generatedExtension] indicates what files will be created for each `.dart`
  /// input.
  /// Defaults to `.g.dart`, however this should usually be changed to
  /// avoid conflicts with outputs from a [SharedPartBuilder].
  /// If [generator] will create additional outputs through the [BuildStep] they
  /// should be indicated in [additionalOutputExtensions].
  ///
  /// [formatOutput] is called to format the generated code. Defaults to
  /// [DartFormatter.format].
  ///
  /// [header] is used to specify the content at the top of each generated file.
  /// If `null`, the content of [defaultFileHeader] is used.
  /// If [header] is an empty `String` no header is added.
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

final _formatter = DartFormatter();

const defaultFileHeader = '// GENERATED CODE - DO NOT MODIFY BY HAND';

final _headerLine = '// '.padRight(77, '*');

const partIdRegExpLiteral = r'[A-Za-z_\d-]+';

final _partIdRegExp = RegExp('^$partIdRegExpLiteral\$');

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
