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
/// It can be also used to annotate ThemeData getter method. This has to be first-class citizen
///
/// Example:
///
/// @FramyTheme()
/// ThemeData getThemeData() => ThemeData(primarySwatch: Colors.orange);
///
class FramyTheme extends FramyAnnotation {
  const FramyTheme();
}

const framyTheme = FramyTheme();

/// Used to annotate a Widget to be included as a component
class FramyWidget extends FramyAnnotation {
  const FramyWidget();
}

const framyWidget = FramyWidget();

/// Used to annotate a model class that can be passed as an argument to the widget's constructor
class FramyModel extends FramyAnnotation {
  const FramyModel();
}

const framyModel = FramyModel();

class FramyPreset extends FramyAnnotation {
  const FramyPreset();
}

const framyPreset = FramyPreset();

class FramyUseProvider extends FramyAnnotation {
  final Type providerType;
  const FramyUseProvider(this.providerType);
}
