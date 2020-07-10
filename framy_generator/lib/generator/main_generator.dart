String generateMain(bool usesRiverpod) {
  String framyApp = 'FramyApp(key: framyAppStateKey)';
  if (usesRiverpod) {
    framyApp = 'ProviderScope(child: $framyApp)';
  }

  return '''
void main() {
  runApp($framyApp);
}
''';
}
