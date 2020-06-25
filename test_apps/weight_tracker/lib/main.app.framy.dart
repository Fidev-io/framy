// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/app_theme.dart';
import 'package:weight_tracker/widgets/user_data_card.dart';
import 'package:weight_tracker/widgets/user_emails_view.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/models/user.framy.dart';

void main() {
  runApp(FramyApp());
}

class FramyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key('FramyApp'),
      theme: AppTheme.themeData,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
    '/appbar': FramyAppBarPage(),
    '/button': FramyButtonPage(),
    '/UserDataCard': FramyUserDataCardCustomPage(),
    '/UserEmailsView': FramyUserEmailsViewCustomPage(),
  };
  final page = routes[settings.name] ?? FramyFontsPage();
  return PageRouteBuilder<dynamic>(
    pageBuilder: (_, __, ___) => FramyLayoutTemplate(child: page),
    settings: settings,
  );
}

class FramyLayoutTemplate extends StatelessWidget {
  final Widget child;

  const FramyLayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxWidth < 1000;
        return Scaffold(
          appBar: FramyAppBar(),
          body: Row(
            children: [
              if (!isSmallDevice) FramyDrawer(),
              Expanded(
                child: child,
              ),
            ],
          ),
          drawer: isSmallDevice ? FramyDrawer() : null,
        );
      },
    );
  }
}

class FramyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('FramyAppBar'),
      title: Text('Framy App'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FramyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
                child: Text('Framy App'),
              ),
              ListTile(
                leading: Icon(Icons.text_fields),
                title: Text('Typography'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/typography'),
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Color scheme'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/colors'),
              ),
              Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.black54),
                child: ExpansionTile(
                  leading: Icon(Icons.category),
                  title: Text(
                    'Material components',
                    style: TextStyle(color: Colors.black),
                  ),
                  children: [
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('AppBar'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/appbar'),
                    ),
                    ListTile(
                      key: Key('MaterialComponentsButtonButton'),
                      leading: SizedBox.shrink(),
                      title: Text('Button'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/button'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('UserDataCard'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/UserDataCard'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('UserEmailsView'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/UserEmailsView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FramyFontsPage extends StatelessWidget {
  const FramyFontsPage() : super(key: const Key('FramyFontsPage'));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FramySingleFontRow('Headline1', textTheme.headline1),
          FramySingleFontRow('Headline2', textTheme.headline2),
          FramySingleFontRow('Headline3', textTheme.headline3),
          FramySingleFontRow('Headline4', textTheme.headline4),
          FramySingleFontRow('Headline5', textTheme.headline5),
          FramySingleFontRow('Headline6', textTheme.headline6),
          FramySingleFontRow('Subtitle1', textTheme.subtitle1),
          FramySingleFontRow('Subtitle2', textTheme.subtitle2),
          FramySingleFontRow('BodyText1', textTheme.bodyText1),
          FramySingleFontRow('BodyText2', textTheme.bodyText2),
          FramySingleFontRow('Caption', textTheme.caption),
          FramySingleFontRow('Button', textTheme.button),
          FramySingleFontRow('Overline', textTheme.overline),
        ],
      ),
    );
  }
}

class FramySingleFontRow extends StatelessWidget {
  final String label;
  final TextStyle style;

  const FramySingleFontRow(this.label, [this.style]);

  @override
  Widget build(BuildContext context) {
    final family = style.fontFamily;
    final size = ' / size: ${style.fontSize.toStringAsFixed(1)}';
    final weight =
        ' / weight: ${style.fontWeight.toString().replaceAll('FontWeight.', '')}';
    final height = style.height == null ? '' : ' / height: ${style.height}';
    final letterSpacing = style.letterSpacing == null
        ? ''
        : ' / letter spacing: ${style.letterSpacing}';
    final wordSpacing = style.wordSpacing == null
        ? ''
        : ' / word spacing: ${style.wordSpacing}';
    final color =
        ' / color: #${_hex(style.color.alpha)}${_hex(style.color.red)}${_hex(style.color.green)}${_hex(style.color.blue)}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style),
          Text(
            '$family$size$weight$color$height$letterSpacing$wordSpacing',
          ),
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

class FramyColorsPage extends StatelessWidget {
  const FramyColorsPage() : super(key: const Key('FramyColorsPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      children: [
        _FramyColorItem(
          name: 'defaultAvatarColor',
          color: AppTheme.defaultAvatarColor,
        ),
        _FramyColorItem(
          name: 'Primary',
          color: Theme.of(context).primaryColor,
        ),
        _FramyColorItem(
          name: 'Primary light',
          color: Theme.of(context).primaryColorLight,
        ),
        _FramyColorItem(
          name: 'Primary dark',
          color: Theme.of(context).primaryColorDark,
        ),
        _FramyColorItem(name: 'Canvas', color: Theme.of(context).canvasColor),
        _FramyColorItem(name: 'Accent', color: Theme.of(context).accentColor),
        _FramyColorItem(
          name: 'Scaffold background',
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Bottom appbar',
          color: Theme.of(context).bottomAppBarColor,
        ),
        _FramyColorItem(name: 'Card', color: Theme.of(context).cardColor),
        _FramyColorItem(
          name: 'Divider',
          color: Theme.of(context).dividerColor,
        ),
        _FramyColorItem(name: 'Focus', color: Theme.of(context).focusColor),
        _FramyColorItem(name: 'Hover', color: Theme.of(context).hoverColor),
        _FramyColorItem(
          name: 'Highlight',
          color: Theme.of(context).highlightColor,
        ),
        _FramyColorItem(name: 'Splash', color: Theme.of(context).splashColor),
        _FramyColorItem(
          name: 'Disabled',
          color: Theme.of(context).disabledColor,
        ),
        _FramyColorItem(name: 'Button', color: Theme.of(context).buttonColor),
        _FramyColorItem(
          name: 'Text selection',
          color: Theme.of(context).textSelectionColor,
        ),
        _FramyColorItem(name: 'Cursor', color: Theme.of(context).cursorColor),
        _FramyColorItem(
          name: 'Text selection handle',
          color: Theme.of(context).textSelectionHandleColor,
        ),
        _FramyColorItem(
          name: 'Background',
          color: Theme.of(context).backgroundColor,
        ),
        _FramyColorItem(
          name: 'Dialog background',
          color: Theme.of(context).dialogBackgroundColor,
        ),
        _FramyColorItem(
          name: 'Indicator',
          color: Theme.of(context).indicatorColor,
        ),
        _FramyColorItem(name: 'Hint', color: Theme.of(context).hintColor),
        _FramyColorItem(name: 'Error', color: Theme.of(context).errorColor),
        _FramyColorItem(
          name: 'Toggleable Active',
          color: Theme.of(context).toggleableActiveColor,
        ),
        _FramyColorItem(
          name: 'Primary',
          color: Theme.of(context).colorScheme.primary,
        ),
        _FramyColorItem(
          name: 'Primary variant',
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
        _FramyColorItem(
          name: 'Secondary',
          color: Theme.of(context).colorScheme.secondary,
        ),
        _FramyColorItem(
          name: 'Secondary variant',
          color: Theme.of(context).colorScheme.secondaryVariant,
        ),
        _FramyColorItem(
          name: 'Background',
          color: Theme.of(context).colorScheme.background,
        ),
        _FramyColorItem(
          name: 'Surface',
          color: Theme.of(context).colorScheme.surface,
        ),
        _FramyColorItem(
          name: 'Error',
          color: Theme.of(context).colorScheme.error,
        ),
        _FramyColorItem(
          name: 'On primary',
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        _FramyColorItem(
          name: 'On secondary',
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        _FramyColorItem(
          name: 'On background',
          color: Theme.of(context).colorScheme.onBackground,
        ),
        _FramyColorItem(
          name: 'On surface',
          color: Theme.of(context).colorScheme.onSurface,
        ),
        _FramyColorItem(
          name: 'On error',
          color: Theme.of(context).colorScheme.onError,
        ),
      ],
    );
  }
}

class _FramyColorItem extends StatelessWidget {
  final String name;
  final Color color;

  const _FramyColorItem({Key key, @required this.name, @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.5),
          width: 0.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  key: Key(name),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '#${_hex(color.alpha)}${_hex(color.red)}${_hex(color.green)}${_hex(color.blue)}',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _hex(int val) => val.toRadixString(16).padLeft(2, '0').toUpperCase();
}

class FramyHeaderText extends StatelessWidget {
  final String text;

  const FramyHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

class FramyAppBarPage extends StatelessWidget {
  const FramyAppBarPage() : super(key: const Key('FramyAppBarPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FramyHeaderText('AppBar'),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: BackButton(),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppBar(
            title: Text('AppBar'),
            leading: CloseButton(),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Edit')),
                  PopupMenuItem(child: Text('Save')),
                  PopupMenuItem(child: Text('Delete')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FramyButtonPage extends StatelessWidget {
  const FramyButtonPage() : super(key: const Key('FramyButtonPage'));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FramyHeaderText('Raised button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  RaisedButton(child: Text('Button'), onPressed: () {}),
                  RaisedButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Flat button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  FlatButton(child: Text('Button'), onPressed: () {}),
                  FlatButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Outline button'),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  OutlineButton(child: Text('Button'), onPressed: () {}),
                  OutlineButton(child: Text('Button'), onPressed: null),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Floating Action Button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    heroTag: 'FabTag1',
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.delete),
                    onPressed: null,
                    heroTag: 'FabTag2',
                  ),
                  FloatingActionButton.extended(
                    icon: Icon(Icons.delete),
                    label: Text('Button'),
                    onPressed: () {},
                    heroTag: 'FabTag3',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Icon button'),
              const SizedBox(height: 4),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FramyUserDataCardCustomPage extends StatefulWidget {
  const FramyUserDataCardCustomPage()
      : super(key: const Key('Framy_UserDataCard_Page'));

  @override
  _FramyUserDataCardCustomPageState createState() =>
      _FramyUserDataCardCustomPageState();
}

class _FramyUserDataCardCustomPageState
    extends State<FramyUserDataCardCustomPage> {
  List<FramyDependencyModel> dependencies = [
    FramyDependencyModel<User>('user', 'User', null, [
      FramyDependencyModel<String>('firstName', 'String', null, []),
      FramyDependencyModel<String>('lastName', 'String', null, []),
      FramyDependencyModel<int>('age', 'int', null, []),
      FramyDependencyModel<List<String>>('emails', 'List<String>', null, []),
    ]),
  ];
  final Map<String, Map<String, dynamic>> presets = createFramyPresets();

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  void onChanged(String name, dynamic dependencyValue) {
    setState(
      () {
        dependency(name).value = dependencyValue;
        if (dependencyValue == null) {
          dependency(name).subDependencies.forEach((subDependency) {
            subDependency.value = null;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final body = Row(
            children: [
              Expanded(
                child: UserDataCard(
                  user: dependency('user').value,
                ),
              ),
              if (!isSmallDevice)
                SizedBox(
                  width: 300,
                  child: FramyWidgetDependenciesPanel(
                    dependencies: dependencies,
                    presets: presets,
                    onChanged: onChanged,
                  ),
                ),
            ],
          );
          if (isSmallDevice) {
            return Scaffold(
              body: body,
              floatingActionButton: FramyWidgetDependenciesFAB(
                dependencies: dependencies,
                presets: presets,
                onChanged: onChanged,
              ),
            );
          } else {
            return body;
          }
        },
      ),
    );
  }
}

class FramyUserEmailsViewCustomPage extends StatefulWidget {
  const FramyUserEmailsViewCustomPage()
      : super(key: const Key('Framy_UserEmailsView_Page'));

  @override
  _FramyUserEmailsViewCustomPageState createState() =>
      _FramyUserEmailsViewCustomPageState();
}

class _FramyUserEmailsViewCustomPageState
    extends State<FramyUserEmailsViewCustomPage> {
  List<FramyDependencyModel> dependencies = [
    FramyDependencyModel<User>('user', 'User', null, [
      FramyDependencyModel<String>('firstName', 'String', null, []),
      FramyDependencyModel<String>('lastName', 'String', null, []),
      FramyDependencyModel<int>('age', 'int', null, []),
      FramyDependencyModel<List<String>>('emails', 'List<String>', null, []),
    ]),
  ];
  final Map<String, Map<String, dynamic>> presets = createFramyPresets();

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  void onChanged(String name, dynamic dependencyValue) {
    setState(
      () {
        dependency(name).value = dependencyValue;
        if (dependencyValue == null) {
          dependency(name).subDependencies.forEach((subDependency) {
            subDependency.value = null;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final body = Row(
            children: [
              Expanded(
                child: UserEmailsView(
                  user: dependency('user').value,
                ),
              ),
              if (!isSmallDevice)
                SizedBox(
                  width: 300,
                  child: FramyWidgetDependenciesPanel(
                    dependencies: dependencies,
                    presets: presets,
                    onChanged: onChanged,
                  ),
                ),
            ],
          );
          if (isSmallDevice) {
            return Scaffold(
              body: body,
              floatingActionButton: FramyWidgetDependenciesFAB(
                dependencies: dependencies,
                presets: presets,
                onChanged: onChanged,
              ),
            );
          } else {
            return body;
          }
        },
      ),
    );
  }
}

class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  final List<FramyDependencyModel> subDependencies;
  T lastNonNullValue;

  FramyDependencyModel(this.name, this.type, this.value, this.subDependencies);
}

class FramyWidgetDependenciesPanel extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetDependenciesPanel(
      {Key key, this.dependencies, this.onChanged, this.presets})
      : super(key: const Key('FramyWidgetDependenciesPanel'));

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          child: Column(
            children: dependencies
                .map((dep) => FramyWidgetDependencyInput(
                      dependency: dep,
                      onChanged: onChanged,
                      presets: presets,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class FramyWidgetDependenciesFAB extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetDependenciesFAB(
      {Key key, this.onChanged, this.dependencies, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'FramyWidgetDependenciesButton',
      child: Icon(Icons.tune),
      key: const Key('FramyWidgetDependenciesButton'),
      onPressed: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              SizedBox(
                height: 2,
                key: Key('framySheetDragHandle'),
              ),
              Expanded(
                child: FramyWidgetDependenciesPanel(
                  dependencies: dependencies,
                  presets: presets,
                  onChanged: (s, v) {
                    setState(() {});
                    onChanged(s, v);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      mini: true,
    );
  }
}

class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_${dependency.name}_input');
    final chosenPreset = presets[dependency.type]?.values?.firstWhere(
          (el) => el == dependency.value,
          orElse: () => null,
        );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dependency.name),
            FramyWidgetDependencyNullSwitch(
              dependency: dependency,
              onChanged: (val) => onChanged(dependency.name, val),
            ),
          ],
        ),
        if (presets.containsKey(dependency.type))
          FramyPresetDropdown(
            dependency: dependency,
            chosenPreset: chosenPreset,
            onChanged: onChanged,
            presets: presets,
          ),
        if (chosenPreset == null)
          if (dependency.type == 'bool')
            DropdownButton<bool>(
              key: inputKey,
              value: dependency.value,
              onChanged: (val) {
                if (val != null) {
                  dependency.lastNonNullValue = val;
                }
                onChanged(dependency.name, val);
              },
              items: [
                DropdownMenuItem(
                  value: true,
                  child: Text('True'),
                ),
                DropdownMenuItem(
                  value: false,
                  child: Text('False'),
                )
              ],
            )
          else if (dependency.type == 'String' ||
              dependency.type == 'int' ||
              dependency.type == 'double')
            TextFormField(
              key: inputKey,
              initialValue: dependency.value?.toString(),
              autovalidate: true,
              validator: (value) {
                String error;
                if (dependency.type == 'int') {
                  if (int.tryParse(value) == null) {
                    error = 'Invalid integer value';
                  }
                } else if (dependency.type == 'double') {
                  if (double.tryParse(value) == null) {
                    error = 'Invalid double value';
                  }
                }
                return error;
              },
              onChanged: (s) {
                var valueToReturn;
                if (dependency.type == 'int') {
                  valueToReturn = int.tryParse(s);
                } else if (dependency.type == 'double') {
                  valueToReturn = double.tryParse(s);
                } else {
                  valueToReturn = s;
                }
                if (valueToReturn != null) {
                  dependency.lastNonNullValue = valueToReturn;
                  onChanged(dependency.name, valueToReturn);
                }
              },
            )
          else if (dependency.type == 'User')
            FramyModelInput(
              dependencies: dependency.subDependencies,
              presets: presets,
              onChanged: (_) => onChanged(
                dependency.name,
                framyModelConstructorMap[dependency.type]?.call(dependency),
              ),
            )
          else if (dependency.type.startsWith('List<'))
            FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (model) =>
                  onChanged(dependency.name, dependency.value),
              presets: presets,
            )
          else
            Text('Not supported type')
      ],
    );
  }
}

class FramyModelInput extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<List<FramyDependencyModel>> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  FramyModelInput({Key key, this.onChanged, this.dependencies, this.presets})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: dependencies
            .map((dep) => FramyWidgetDependencyInput(
                  dependency: dep,
                  presets: presets,
                  onChanged: (name, value) {
                    dependency(name).value = value;
                    onChanged(dependencies);
                  },
                ))
            .toList(),
      ),
    );
  }
}

class FramyWidgetListDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyWidgetListDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String listType = dependency.type.substring(
      dependency.type.indexOf('<') + 1,
      dependency.type.lastIndexOf('>'),
    );
    return Column(
      key: Key(dependency.value?.length?.toString()),
      children: [
        if (dependency.value != null)
          for (int i = 0; i < dependency.value.length; i++)
            Row(
              children: [
                Expanded(
                  child: FramyWidgetDependencyInput(
                    dependency: FramyDependencyModel(
                      'List element ${i + 1}',
                      listType,
                      dependency.value[i],
                      [],
                    ),
                    onChanged: (name, val) {
                      dependency.value[i] = val;
                      onChanged(dependency);
                    },
                    presets: presets,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  key: Key(
                      'framy_dependency_List element ${i + 1}_delete_button'),
                  icon: Icon(Icons.close),
                  onPressed: () {
                    dependency.value.removeAt(i);
                    onChanged(dependency);
                  },
                )
              ],
            ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            if (dependency.value == null) {
              if (listType == 'String') dependency.value = <String>[];
              if (listType == 'int') dependency.value = <int>[];
              if (listType == 'double') dependency.value = <double>[];
              if (listType == 'bool') dependency.value = <bool>[];
              if (listType == 'User') dependency.value = <User>[];
            }
            dependency.value.add(null);
            onChanged(dependency);
          },
        ),
      ],
    );
  }
}

class FramyPresetDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final dynamic chosenPreset;

  const FramyPresetDropdown(
      {Key key,
      this.dependency,
      this.onChanged,
      this.presets,
      this.chosenPreset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      key: Key('framy_${dependency.name}_preset_dropdown'),
      value: chosenPreset,
      onChanged: (val) => onChanged(
        dependency.name,
        val ?? framyModelConstructorMap[dependency.type]?.call(dependency),
      ),
      items: [
        DropdownMenuItem(
          value: null,
          child: Text('Custom'),
        ),
        ...presets[dependency.type].entries.map(
              (entry) => DropdownMenuItem(
                child: Text(entry.key),
                value: entry.value,
              ),
            ),
      ],
    );
  }
}

final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  'User': (dep) => User(
        dep.subDependencies.singleWhere((d) => d.name == 'firstName').value,
        dep.subDependencies.singleWhere((d) => d.name == 'lastName').value,
        dep.subDependencies.singleWhere((d) => d.name == 'age').value,
        emails:
            dep.subDependencies.singleWhere((d) => d.name == 'emails').value,
      ),
  'String': (dep) => '',
  'double': (dep) => 0.0,
  'int': (dep) => 0,
  'bool': (dep) => false,
};

Map<String, Map<String, dynamic>> createFramyPresets() => {
      'User': {
        'teenageJohn': teenageJohn(),
      },
    };

class FramyWidgetDependencyNullSwitch extends StatelessWidget {
  final ValueChanged<dynamic> onChanged;
  final FramyDependencyModel dependency;

  const FramyWidgetDependencyNullSwitch(
      {Key key, this.onChanged, this.dependency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      key: Key('framy_dependency_${dependency.name}_null_switch'),
      value: dependency.value != null,
      onChanged: (bool isActive) {
        if (isActive) {
          dependency.subDependencies.forEach((subDependency) {
            subDependency.value = subDependency.lastNonNullValue;
          });
          onChanged(dependency.lastNonNullValue ??
              framyModelConstructorMap[dependency.type]?.call(dependency));
        } else {
          onChanged(null);
        }
      },
    );
  }
}
