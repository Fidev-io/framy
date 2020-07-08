import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generateFramyApp([List<FramyObject> themeObjects]) => '''
final framyAppStateKey = GlobalKey<_FramyAppState>();

class FramyAppSettingsState extends InheritedWidget {
  final bool wrapWithScaffold;

  const FramyAppSettingsState({
    Key key,
    @required Widget child,
    @required this.wrapWithScaffold,
  })  : assert(child != null),
        super(key: key, child: child);

  static FramyAppSettingsState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FramyAppSettingsState>();
  }

  @override
  bool updateShouldNotify(FramyAppSettingsState old) =>
      old.wrapWithScaffold != wrapWithScaffold;
}

class FramyApp extends StatefulWidget {
  FramyApp({Key key}) : super(key: key);

  @override
  _FramyAppState createState() => _FramyAppState();
}

class _FramyAppState extends State<FramyApp> {
  bool _wrapWithScaffold = true;

  void set wrapWithScaffold(bool value) =>
      setState(() => _wrapWithScaffold = value);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettingsState(
      wrapWithScaffold: _wrapWithScaffold,
      child: MaterialApp(
        key: Key('FramyApp'),
        ${_generateThemeDataLine(themeObjects)}
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
''';

String _generateThemeDataLine(List<FramyObject> themeObjects) {
  if (themeObjects == null || themeObjects.isEmpty) {
    return '';
  } else {
    final themeObject = themeObjects
        .firstWhere((object) => object.type == FramyObjectType.themeData);
    return 'theme: ${generateAccessibleElement(themeObject)},';
  }
}
