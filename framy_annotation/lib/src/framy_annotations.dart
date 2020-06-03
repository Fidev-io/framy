/// Super class for all other Framy annotations
abstract class FramyAnnotation {
  const FramyAnnotation();
}

/// Specifies a location where generated Framy app will be placed
/// Required to be used exactly once inside the app
/// Typically annotates main app widget (e.g. MyApp, MainApp, etc)
class FramyApp extends FramyAnnotation {
  const FramyApp();
}

const framyApp = FramyApp();

/// Used to annotate a class which contains methods/fields/constructors for ThemeData and Colors
///
/// Example:
///
/// @FramyTheme()
/// class AppTheme {
///   static ThemeData get getTheme => ThemeData(primarySwatch: Colors.orange);
///   Color get getterBlack => Colors.black;
///   Color methodBlack() => Colors.black;
///   static const staticConstWhite = Colors.white;
///   static final staticFinalWhite = Colors.white;
///   static var staticVarWhite = Colors.white;
///   final finalWhite = Colors.white;
///   Color colorWhite = Colors.white;
/// }
///
class FramyTheme extends FramyAnnotation {
  const FramyTheme();
}

const framyTheme = FramyTheme();

/// Used to annotate ThemeData getter method. This has to be first-class citizen
///
/// Example:
///
/// @FramyThemeData
/// ThemeData getThemeData() => ThemeData(primarySwatch: Colors.orange);
///
class FramyThemeData extends FramyAnnotation {
  const FramyThemeData();
}

const framyThemeData = FramyThemeData();

/// Used to annotate a Widget to be included as a component
class FramyWidget<T> extends FramyAnnotation {
  final List<String> configs;
  final List<String> extraImports;
  final String page;

  const FramyWidget({this.configs, this.extraImports, this.page});
}

/// Used to annotate a class containing Widget accessors to be included as a component
class FramyWidgets extends FramyAnnotation {
  const FramyWidgets();
}

/// Used to specify a PageName for a widget to be put in.
/// Currently used only in [FramyWidgets]
class FramyPageName extends FramyAnnotation {
  final String name;

  const FramyPageName(this.name);
}
