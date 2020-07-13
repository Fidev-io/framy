import 'package:framy_generator/framy_object.dart';
import 'package:framy_generator/generator/accessible_element_generator.dart';

String generateFramyApp(List<FramyObject> themeObjects, bool usesRiverpod) =>
    '''
final framyAppStateKey = GlobalKey<_FramyAppState>();

class FramyApp extends StatefulWidget {
  FramyApp() : super(key: framyAppStateKey);

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
    return ${_generateFramyAppBuildMethod(themeObjects, usesRiverpod)};
  }
}

class FramyAppSettings extends InheritedWidget {
  final bool wrapWithScaffold;
  final bool wrapWithCenter;
  final bool wrapWithSafeArea;

  const FramyAppSettings({
    Key key,
    @required Widget child,
    @required this.wrapWithScaffold,
    @required this.wrapWithCenter,
    @required this.wrapWithSafeArea,
  })  : assert(child != null),
        super(key: key, child: child);

  static FramyAppSettings of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FramyAppSettings>();
  }

  @override
  bool updateShouldNotify(FramyAppSettings old) =>
      old.wrapWithScaffold != wrapWithScaffold ||
      old.wrapWithCenter != wrapWithCenter ||
      old.wrapWithSafeArea != wrapWithSafeArea;
}
''';

String _generateFramyAppBuildMethod(
    List<FramyObject> themeObjects, bool usesRiverpod) {
  String framyAppBuild = ''' FramyAppSettings(
      wrapWithScaffold: _wrapWithScaffold,
      wrapWithCenter: _wrapWithCenter,
      wrapWithSafeArea: _wrapWithSafeArea,
      child: MaterialApp(
        key: Key('FramyApp'),
        debugShowCheckedModeBanner: false,
        ${_generateThemeDataLine(themeObjects)}
        onGenerateRoute: onGenerateRoute,
      ),
    )
    ''';
  if (usesRiverpod) {
    framyAppBuild = 'ProviderScope(child: $framyAppBuild,)';
  }
  return framyAppBuild;
}

String _generateThemeDataLine(List<FramyObject> themeObjects) {
  if (themeObjects == null || themeObjects.isEmpty) {
    return '';
  } else {
    final themeObject = themeObjects
        .firstWhere((object) => object.type == FramyObjectType.themeData);
    return 'theme: ${generateAccessibleElement(themeObject)},';
  }
}
