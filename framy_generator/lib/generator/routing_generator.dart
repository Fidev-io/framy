String generateRouting() => '''
Route onGenerateRoute(RouteSettings settings) {
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: FramyFontsPage()),
    settings: settings,
  );
}
''';
