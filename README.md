# Framy

[![DemoApp](https://img.shields.io/badge/Github%20Pages-Demo%20App-brightgreen)](https://fidev-io.github.io/framy/) [![Acceptance tests](https://github.com/Fidev-io/framy/workflows/Acceptance%20tests/badge.svg?event=push)](https://github.com/Fidev-io/framy/actions?query=workflow%3A%22Acceptance+tests%22) [![Unit tests](https://github.com/Fidev-io/framy/workflows/Unit%20tests/badge.svg?event=push)](https://github.com/Fidev-io/framy/actions?query=workflow%3A%22Unit+tests%22)  

A convenient code generator for app styleguide, gallery, wireframes and/or storyboard.

# Packages:

* [framy_annotation](https://github.com/Fidev-io/framy/tree/master/framy_annotation) [![pub package](https://img.shields.io/pub/v/framy_annotation.svg)](https://pub.dartlang.org/packages/framy_annotation)
* [framy_generator](https://github.com/Fidev-io/framy/tree/master/framy_generator) [![pub package](https://img.shields.io/pub/v/framy_generator.svg)](https://pub.dartlang.org/packages/framy_generator)

# Idea

The idea behind Framy is to allow developers, designers, testers, managers and clients to easily access the components used in the Flutter app.

Framy is annotation-driven tool based on which you can generate
* a style guide describing the theme of your app
* a component gallery showing the widgets you have written in out-of-context way
* *[Planned] a playground for testing widgets with a variety of dependencies*
* *[Planned] a storyboard with you app's pages*
* *[Planned] a wireframes with you app's pages*
* *[Planned] an automated UI regression testing framework*

The generated application is mobile, tablet, desktop and web friendly. Framy generated a separate main file with a separate MaterialApp but it does use the same widgets you are using in your own Flutter app

# How to use
## Install

To use Framy, you will need your typical build_runner/code-generator setup.  
First, install build_runner and Framy by adding them to your pubspec.yaml file:

```yaml
# pubspec.yaml
dependencies:
  framy_annotation:

dev_dependencies:
  build_runner:
  framy_generator:
```

## Add the @FramyApp annotation
```dart
@FramyApp() //<--- Add this annotation
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(...);
  }
}
```
`@FramyApp` annotation is coming from `framy_annotations` package. It's only purpose is to specify where the Framy app should be generated. Without this, the generator will not work. There should be only one `@FramyApp` annotation for the project.

## Run the generator
You can either run
`flutter pub run build_runner build` to generate the app from the current code or `flutter pub run build_runner watch` to keep listening to changes in the source code and update the Framy app accordingly.

# Features
## Using app's Theme
👉This is the most important feature of Framy.

Specyfing a Theme will let you browse through fonts, styles, colors and material widgets used in your app. It also provides a ThemeData for all other widgets.

You can use `@FramyTheme` to annotate the method returning `ThemeData` so that the generated app will use the `Theme` you are using in your app. Method annotated this way has to be accessible from the outside so it needs to be public.
```dart
@FramyTheme()
ThemeData getThemeData() => ThemeData(errorColor: Colors.redAccent);
``` 
Alternatively, you can annotate a class which has a accessor (a field, method, getter) returning a `ThemeData` object. In such case, Framy will also use all `Colors` defined in that class.
```dart
@FramyTheme()
class AppTheme {
  ThemeData getThemeData() => ThemeData(errorColor: Colors.redAccent);
  
  final appWhite = Color(0xFFF0F0F0);
}
```

## Using own Widgets
To add a widget into generated Framy app, all you have to do is add `@FramyWidget` annotation to the class. This will add new list item to the navigation drawer dedicated to the annotated widget.
```dart
@FramyWidget()
class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
Framy allows you to change the primitive parameters (`String`, `bool`, `int`, `double`) passed to the widget in constructor via the GUI in generated app.

# Maintenance

Our purpose is to make this tool as comprehensive as possible. We are trying to constantly improve it, add new features, handle new cases and fix any bugs.

If there is any use-case that we do not support and you think we should, feel free to [submit an issue](https://github.com/Fidev-io/framy/issues/new) on GitHub. 🙂