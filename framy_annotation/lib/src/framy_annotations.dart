/// Super class for all other Framy annotations
abstract class FramyAnnotation {
  const FramyAnnotation();
}

/// Specifies a location where generated Framy app will be placed
/// Required to be used exactly once inside the app
/// Typically annotates main app widget (e.g. MyApp, MainApp, etc)
/// [useDevicePreview] - setting this to true will cause wrapping widgets in DevicePreview in generated Framy app
/// we highly recommend using this feature,
/// **IMPORTANT**: when it's set to true then it is required to add device_preview package as dependency in pubspec.yaml!
class FramyApp extends FramyAnnotation {
  final bool useDevicePreview;

  const FramyApp({this.useDevicePreview = false});
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

/// Used to annotate methods returning objects that are meant to be preset dependencies for widgets
///
/// Example:
///
/// @framyPreset
/// User teenageJohn() => User('John', 'Doe', age: 13);
///
class FramyPreset extends FramyAnnotation {
  const FramyPreset();
}

const framyPreset = FramyPreset();

/// Used to widgets that require Provider with a specified [type] to work
///
/// Example:
///
/// @FramyUseProvider(User)
/// @framyWidget
/// class ProfilePage extends StatelessWidget {
///
///   @override
///   Widget build(BuildContext context) {
///     return Consumer<User>( //<-- Framy will take care of this
///       builder: (context, user, child) {
///         return ...;
///       },
///     );
///   }
/// }
///
class FramyUseProvider extends FramyAnnotation {
  final Type providerType;

  const FramyUseProvider(this.providerType);
}

/// Used to widgets that want to override riverpod dependency and change it in generated app.
/// A [providerName] is the name of Provider object that needs to overridden
///
/// Using [FramyUseRiverpod] also requires using [FramyRegisterRiverpod]!
///
/// Example:
///
/// @FramyRegisterRiverpod()
/// final userProvider = Provider((ref) => User('Adam', 'Smith'));
///
/// @FramyUseRiverpod('userProvider')
/// @framyWidget
/// class UserPage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Consumer((context, read) {
///       final user = read(userProvider);
///       ...
///     });
///   }
/// }
///
class FramyUseRiverpod extends FramyAnnotation {
  final String providerName;

  const FramyUseRiverpod(this.providerName);
}

/// Used to annotate providers that are meant to be overridden for widgets
///
/// See example for annotation: [FramyUseRiverpod]
///
class FramyRegisterRiverpod extends FramyAnnotation {
  const FramyRegisterRiverpod();
}

const framyRegisterRiverpod = const FramyRegisterRiverpod();
