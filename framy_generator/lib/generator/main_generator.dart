String generateMain() => '''
void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(FramyApp());
}
''';
