import 'dart:io';

import 'package:framy_generator/config/framy_config.dart';
import 'package:yaml/yaml.dart';

Future<FramyConfig> loadFramyConfig() async {
  var yamlMap = await loadConfigFile('framy.yaml');
  if (yamlMap.isEmpty) {
    yamlMap = await loadConfigFile('pubspec.yaml');
  }

  final config = FramyConfig()
    ..wrapWithDevicePreview = yamlMap['wrap-with-devicepreview'] ?? true
    ..wrapWithScaffold = yamlMap['wrap-with-scaffold'] ?? true
    ..wrapWithCenter = yamlMap['wrap-with-center'] ?? false
    ..wrapWithSafeArea = yamlMap['wrap-with-safearea'] ?? false
    ..showMaterialComponents = yamlMap['show-material-components'] ?? true
    ..showStoryboard = yamlMap['show-storyboard'] ?? true;
  return config;
}

Future<Map<String, dynamic>> loadConfigFile(String path) async {
  final file = File(path);
  if (!await file.exists()) {
    return {};
  }
  final yamlString = file.readAsStringSync();
  final yamlMap = loadYaml(yamlString);

  if ((yamlMap?.containsKey('framy') ?? false) && yamlMap['framy'] is Map) {
    return Map.from(yamlMap['framy']);
  } else {
    return {};
  }
}
