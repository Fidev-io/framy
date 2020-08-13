# Framy_generator

[![Example apps](https://img.shields.io/badge/Github%20Pages-Example%20Apps-brightgreen)](https://fidev-io.github.io/framy/)
[![Acceptance tests](https://github.com/Fidev-io/framy/workflows/Acceptance%20tests/badge.svg?event=push)](https://github.com/Fidev-io/framy/actions?query=workflow%3A%22Acceptance+tests%22)
[![Unit tests](https://github.com/Fidev-io/framy/workflows/Unit%20tests/badge.svg?event=push)](https://github.com/Fidev-io/framy/actions?query=workflow%3A%22Unit+tests%22)
[<img src="https://img.shields.io/badge/slack-FramyChat-yellow.svg?logo=slack">](https://join.slack.com/t/framy/shared_invite/zt-ffqv9tgl-kpn8cLNnPtPTeEK_Pa5ckA)
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)  

A convenient code generator for app styleguide, gallery, wireframes and/or storyboard.

👉 [Official documentation](https://framy.dev) 👈  


## Packages

In order to use Framy, you will need two following packages:

* [framy_annotation](https://pub.dev/packages/framy_annotation) - A package containing annotation classes.
* [framy_generator](https://pub.dev/packages/framy_generator) - A powerful code generator which creates whole application based on the annotations used.

| Package                                                                            | Pub                                                                                                    |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [framy_annotation](https://pub.dev/packages/framy_annotation) | [![pub package](https://img.shields.io/pub/v/framy_annotation.svg)](https://pub.dev/packages/framy_annotation) |
| [framy_generator](https://pub.dev/packages/framy_generator)   | [![pub package](https://img.shields.io/pub/v/framy_generator.svg)](https://pub.dev/packages/framy_generator) |

## Examples
* [Counter app](https://framy.dev/#/counter)
* [WeightTracker](https://framy.dev/#/weighttracker)

![ezgif com-video-to-gif (16)](https://user-images.githubusercontent.com/16286046/86018379-8d930400-ba25-11ea-9a85-a585c3b2b84f.gif)

## Idea

The idea behind Framy is to allow developers, designers, testers, managers and clients to easily access the components used in the Flutter app.

Framy is annotation-driven tool based on which you can generate: 
* a style guide describing the theme of your app
* a component gallery showing the widgets you have written in out-of-context way
* a playground for testing widgets with a variety of dependencies
* and much more coming soon...


### What makes Framy special?
* Fully responsive
  * The generated application is mobile, tablet, desktop and web friendly. Framy generates a separate main file with a separate MaterialApp but it does use the same widgets you are using in your own Flutter app.
* Standalone
  * You can easily host generated app the way you prefer or just run it locally. (Automated hosting of Framy App is planned as well 😉)
* Non-invasive
  * Framy doesn't require using any special widgets to be working. There is no `Framy` widget to wrap your app in so it doesn't affect your actual product. Only annotations.


## Installation

### Get packages

To use Framy, you will need your typical build_runner/code-generator setup.  
First, install `build_runner` and Framy by adding them to your `pubspec.yaml` file:  

```yaml
dependencies:
  framy_annotation:

dev_dependencies:
  build_runner:
  framy_generator:
```

### Add the @FramyApp annotation
`@FramyApp` annotation is coming from `framy_annotations` package. It's only purpose is to specify where the Framy app should be generated. Without this, the generator will not work. There should be only one `@FramyApp` annotation for the project.

```dart
@FramyApp() //<--- Add this annotation
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(...);
  }
}
```

### Run the generator
You can either run
`flutter pub run build_runner build` to generate the app from the current code or `flutter pub run build_runner watch` to keep listening to changes in the source code and update the Framy app accordingly.

### Run the generated app
Generator creates a new main file. Run `flutter run lib/main.app.framy.dart` to use Framy!


## Annotations

Framy Annotations package offers a variety of annotations to generate the widest variety of pages in your Framy App.

### FramyTheme

> FramyTheme points out the ThemeData used in the Flutter application.

#### Using with ThemeData method or field

Since Framy uses the same widgets you do, it should use the same Theme as well. Use `FramyTheme` annotations to specify the Theme you are using. Based on that, Framy will generate your typography and color palette as well as it will use that theme for any other widget in the catalog.

```dart
@FramyTheme()
ThemeData getThemeData() => ThemeData(primarySwatch: Colors.orange);
```

> Method annotated with FramyTheme must be public (available to use from outside the file)!

#### Using with custom theme class

Alternatively, you can use FramyTheme annotation with your own Theme class. If you have any colors (methods, fields, getters) defined in a class annotated with `FramyTheme` they will also be used in your color palette.

```dart
@FramyTheme()
 class AppTheme {
   static ThemeData get getTheme => ThemeData(primarySwatch: Colors.orange);
   Color get myAppBlack => Colors.black;
   static const myCompanyColorWhite = Color(0xFFFEFEFE);
}
```

> There can be only one ThemeData accessor annotated in a project

### FramyWidget

> Annotate your Widget classes to include them in the gallery.

Framy will generate a dependencies panel which will allow the user to pass any parameters that are defined in the Widget's constructor.

```dart
@FramyWidget()
class CounterTitle extends StatelessWidget {
  final String verb;
  final int counter;

  const CounterTitle({this.verb = 'pushed', this.counter = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('Counter title'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You have $verb the button this many times:'),
        Text('$counter', style: Theme.of(context).textTheme.headline4),
      ],
    );
  }
}
```

### FramyModel

> Annotate your model classes to pass more complex parameters to your widgets

FramyWidget's constructor dependencies support by default only primitive types. In many cases you will pass a custom object instead of String or int. If you want to add an option to change custom dependencies, use FramyModel annotation with your model class.

```dart
@FramyModel()
class User {
  final String firstName;
  final String lastName;
  final int age;
  final List<String> emails;

  User(this.firstName, this.lastName, this.age, {this.emails});
}
```

You can annotate enums the same way:

```dart
@FramyModel()
enum Gender {female, male, other}
```

> If your class uses other custom classes (e.g. Address in User), the subclasses have to be annotated with @framyModel as well

### FramyPreset

> Define dependency presets to speed up testing parameters to your widgets

In cases when your models have a lot of dependencies and it would be a big hustle to click them all through, you can define a preset object models which will be accessible in dependencies panel.

```dart
@FramyPreset()
User teenageJohn() => User('John', 'Smith', 13);
```

Since presets will be part of your normal source code, we recommend having them in a separate file, e.g. for User presets file `user.framy.dart` would do. :)

### FramyUseProvider

> If your widget dependency is passed by Provider and not constructor, just use @FramyUseProvider annotation

FramyUserProvider with FramyWidget will cause the generated app to pass a dependency using wrapped Provider around your widget. 

```dart
@FramyUseProvider(User)
@framyWidget
class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<User>( //<-- Framy will take care of this
      builder: (context, user, child) {
        return ...;
      },
    );
  }
}
```

# Maintenance
Our purpose is to make this tool as comprehensive as possible. We are trying to constantly improve it, add new features, handle new cases and fix any bugs.

If there is any use-case that we do not support and you think we should, feel free to [submit an issue](https://github.com/Fidev-io/framy/issues/new) on GitHub. 🙂

