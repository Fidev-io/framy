import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generateFramyApp([List<FramyObject> themeObjects]) => '''
final framyAppStateKey = GlobalKey<_FramyAppState>();

class FramyAppSettingsState extends InheritedWidget {
  final bool wrapWithScaffold;
  final bool wrapWithCenter;
  final bool wrapWithSafeArea;

  const FramyAppSettingsState({
    Key key,
    @required Widget child,
    @required this.wrapWithScaffold,
    @required this.wrapWithCenter,
    @required this.wrapWithSafeArea,
  })  : assert(child != null),
        super(key: key, child: child);

  static FramyAppSettingsState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FramyAppSettingsState>();
  }

  @override
  bool updateShouldNotify(FramyAppSettingsState old) =>
      old.wrapWithScaffold != wrapWithScaffold ||
      old.wrapWithCenter != wrapWithCenter ||
      old.wrapWithSafeArea != wrapWithSafeArea;
}

class FramyApp extends StatefulWidget {
  FramyApp({Key key}) : super(key: key);

  @override
  _FramyAppState createState() => _FramyAppState();
}

class _FramyAppState extends State<FramyApp> {
  bool _wrapWithScaffold = true;
  bool _wrapWithCenter = false;
  bool _wrapWithSafeArea = false;

  void set wrapWithScaffold(bool value) =>
      setState(() => _wrapWithScaffold = value);

  void set wrapWithCenter(bool value) =>
      setState(() => _wrapWithCenter = value);

  void set wrapWithSafeArea(bool value) =>
      setState(() => _wrapWithSafeArea = value);

  @override
  Widget build(BuildContext context) {
    return FramyAppSettingsState(
      wrapWithScaffold: _wrapWithScaffold,
      wrapWithCenter: _wrapWithCenter,
      wrapWithSafeArea: _wrapWithSafeArea,
      child: MaterialApp(
        key: Key('FramyApp'),
        debugShowCheckedModeBanner: false,
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
