// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FramyGenerator
// **************************************************************************

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:weight_tracker/app_theme.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'dart:core';
import 'package:weight_tracker/pages/history_page.dart';
import 'package:weight_tracker/widgets/weight_entry_list_item.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:weight_tracker/pages/statistics_page.dart';
import 'package:weight_tracker/models/statistics_page_state.dart';
import 'package:weight_tracker/pages/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/widgets/user_emails_view.dart';
import 'package:weight_tracker/widgets/user_data_card.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/widgets/weight_unit_display.dart';
import 'package:weight_tracker/widgets/dummy_test_widget.dart';
import 'package:weight_tracker/models/dummy_test_widget_model.dart';
import 'package:weight_tracker/models/weight_unit.dart';
import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_tracker/models/weight_entry.framy.dart';
import 'package:weight_tracker/models/user.framy.dart';

void main() {
  runApp(FramyApp(key: framyAppStateKey));
}

final framyAppStateKey = GlobalKey<_FramyAppState>();

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
    return FramyAppSettings(
      wrapWithScaffold: _wrapWithScaffold,
      wrapWithCenter: _wrapWithCenter,
      wrapWithSafeArea: _wrapWithSafeArea,
      child: MaterialApp(
        key: Key('FramyApp'),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

Route onGenerateRoute(RouteSettings settings) {
  final routes = {
    '/typography': FramyFontsPage(),
    '/colors': FramyColorsPage(),
    '/appbar': FramyAppBarPage(),
    '/button': FramyButtonPage(),
    '/toggle': FramyTogglePage(),
    '/textfield': FramyTextFieldPage(),
    '/HistoryPage': FramyHistoryPageCustomPage(),
    '/StatisticsPage': FramyStatisticsPageCustomPage(),
    '/ProfilePage': FramyProfilePageCustomPage(),
    '/DummyTestWidget': FramyDummyTestWidgetCustomPage(),
    '/UserDataCard': FramyUserDataCardCustomPage(),
    '/UserEmailsView': FramyUserEmailsViewCustomPage(),
    '/WeightUnitDisplay': FramyWeightUnitDisplayCustomPage(),
    '/WeightEntryListItem': FramyWeightEntryListItemCustomPage(),
    '/storyBoard': FramyStoryBoardPage(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isSmallDevice) FramyDrawer(),
              Expanded(
                child: child,
              ),
            ],
          ),
          drawer: isSmallDevice ? FramyDrawer(showHeader: true) : null,
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
      actions: [
        IconButton(
          key: ValueKey('FramyAppBarSettingsButton'),
          icon: Icon(Icons.settings),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => FramySettingsDialog(),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FramySettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Preview settings'),
      actions: [
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Wrap with Scaffold'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppScaffoldSwitch'),
                onChanged: (b) =>
                    framyAppStateKey.currentState.wrapWithScaffold = b,
                value: FramyAppSettings.of(context).wrapWithScaffold,
              ),
            ],
          ),
          Row(
            children: [
              Text('Wrap with Center'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppCenterSwitch'),
                onChanged: (b) =>
                    framyAppStateKey.currentState.wrapWithCenter = b,
                value: FramyAppSettings.of(context).wrapWithCenter,
              ),
            ],
          ),
          Row(
            children: [
              Text('Wrap with SafeArea'),
              Spacer(),
              Switch(
                key: ValueKey('FramyAppSafeAreaSwitch'),
                onChanged: (b) =>
                    framyAppStateKey.currentState.wrapWithSafeArea = b,
                value: FramyAppSettings.of(context).wrapWithSafeArea,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FramyDrawer extends StatelessWidget {
  final bool showHeader;

  const FramyDrawer({Key key, this.showHeader = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('FramyDrawer'),
      child: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              if (showHeader)
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Framy App'),
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
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('Toggle'),
                      onTap: () =>
                          Navigator.of(context).pushReplacementNamed('/toggle'),
                    ),
                    ListTile(
                      leading: SizedBox.shrink(),
                      title: Text('TextField'),
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed('/textfield'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('HistoryPage'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/HistoryPage'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('StatisticsPage'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/StatisticsPage'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('ProfilePage'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/ProfilePage'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('DummyTestWidget'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/DummyTestWidget'),
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
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('WeightUnitDisplay'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/WeightUnitDisplay'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('WeightEntryListItem'),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed('/WeightEntryListItem'),
              ),
              ListTile(
                leading: SizedBox.shrink(),
                title: Text('Story board'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed('/storyBoard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================== MATERIAL PAGES ===========================

class FramyFontsPage extends StatelessWidget {
  const FramyFontsPage() : super(key: const Key('FramyFontsPage'));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
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

bool isDependencyAPreset(
  Map<String, Map<String, dynamic>> presets,
  FramyDependencyModel dependency,
) =>
    isValueAPreset(presets, dependency.type, dependency.value);

bool isValueAPreset(
  Map<String, Map<String, dynamic>> presets,
  String type,
  dynamic value,
) =>
    presets.containsKey(type) && presets[type].containsValue(value);

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

class FramyButtonPage extends StatefulWidget {
  const FramyButtonPage() : super(key: const Key('FramyButtonPage'));

  @override
  _FramyButtonPageState createState() => _FramyButtonPageState();
}

class _FramyButtonPageState extends State<FramyButtonPage> {
  String selectedOptionInDropdown;

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
                    icon: Icon(Icons.favorite_border),
                    onPressed: null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const FramyHeaderText('Dropdown button'),
              const SizedBox(height: 4),
              DropdownButton(
                hint: Text('Select option'),
                value: selectedOptionInDropdown,
                onChanged: (option) =>
                    setState(() => selectedOptionInDropdown = option),
                items: [
                  DropdownMenuItem(
                    child: Text('Option A'),
                    value: 'Option A',
                  ),
                  DropdownMenuItem(
                    child: Text('Option B'),
                    value: 'Option B',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FramyTogglePage extends StatefulWidget {
  const FramyTogglePage() : super(key: const Key('FramyTogglePage'));

  @override
  _FramyTogglePageState createState() => _FramyTogglePageState();
}

class _FramyTogglePageState extends State<FramyTogglePage> {
  bool switchState = false;
  List<bool> toggleState = [false, true, false];
  bool checkboxState = false;
  String radioState = 'Option A';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('Switch'),
            Switch(
              value: switchState,
              onChanged: (bool value) => setState(() => switchState = value),
            ),
            const FramyHeaderText('Toggle buttons'),
            const SizedBox(height: 8),
            ToggleButtons(
              onPressed: (index) =>
                  setState(() => toggleState[index] = !toggleState[index]),
              isSelected: toggleState,
              children: [
                Icon(Icons.format_bold),
                Icon(Icons.format_italic),
                Icon(Icons.format_align_center),
              ],
            ),
            const SizedBox(height: 8),
            const FramyHeaderText('Checkbox'),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) => setState(() => checkboxState = value),
              value: checkboxState,
              title: Text('Option'),
            ),
            const FramyHeaderText('Radio'),
            RadioListTile(
              value: 'Option A',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option A'),
            ),
            RadioListTile(
              value: 'Option B',
              onChanged: (system) => setState(() => radioState = system),
              groupValue: radioState,
              title: Text('Option B'),
            ),
          ],
        ),
      ),
    );
  }
}

class FramyTextFieldPage extends StatelessWidget {
  const FramyTextFieldPage() : super(key: const Key('FramyTextFieldPage'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FramyHeaderText('TextField'),
            const SizedBox(height: 16),
            TextField(),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Filled TextField with label',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Outline TextField',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'TextField with prefixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye),
                labelText: 'TextField with suffixIcon',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'TextField with error message',
                errorText: 'Invalid value',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Disabled TextField',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================== CUSTOM PAGES ===========================

typedef dynamic DependencyValueGetter(String name);

class FramyCustomPage extends StatefulWidget {
  final List<FramyDependencyModel> dependencies;
  final Widget Function(DependencyValueGetter dependencyValueGetter) builder;

  const FramyCustomPage({Key key, this.dependencies, this.builder})
      : super(key: key);

  @override
  _FramyCustomPageState createState() => _FramyCustomPageState();
}

class _FramyCustomPageState extends State<FramyCustomPage> {
  final Map<String, Map<String, dynamic>> presets = createFramyPresets();
  List<FramyDependencyModel> dependencies;

  @override
  void initState() {
    super.initState();
    dependencies = widget.dependencies;
  }

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  void onChanged(FramyDependencyModel dependencyModel) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final settings = FramyAppSettings.of(context);
    return SafeArea(
      bottom: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallDevice =
              constraints.maxWidth < 1000 - 304 || constraints.maxHeight < 500;
          final body = Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DevicePreview(
                  style: DevicePreviewStyle(
                    toolBar: DevicePreviewToolBarStyle.light(
                      position: DevicePreviewToolBarPosition.right,
                    ),
                    background: BoxDecoration(),
                  ),
                  builder: (context) {
                    Widget widgetToDisplay = widget.builder(dependencyValue);
                    if (settings.wrapWithCenter) {
                      widgetToDisplay = Center(
                        key: ValueKey('FramyGeneratedCenter'),
                        child: widgetToDisplay,
                      );
                    }
                    if (settings.wrapWithSafeArea) {
                      widgetToDisplay = SafeArea(
                        key: ValueKey('FramyGeneratedSafeArea'),
                        child: widgetToDisplay,
                      );
                    }
                    if (settings.wrapWithScaffold) {
                      widgetToDisplay = Scaffold(
                        key: ValueKey('FramyGeneratedScaffold'),
                        body: widgetToDisplay,
                      );
                    }
                    return widgetToDisplay;
                  },
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

class FramyHistoryPageCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_HistoryPage_Page'),
      dependencies: [
        FramyDependencyModel<List<WeightEntry>>(
            'weightEntries', 'List<WeightEntry>', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return HistoryPage(
          weightEntries: valueGetter('weightEntries'),
        );
      },
    );
  }
}

class FramyStatisticsPageCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_StatisticsPage_Page'),
      dependencies: [
        FramyDependencyModel<StatisticsPageState>(
            'state', 'StatisticsPageState', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return StatisticsPage(
          state: valueGetter('state'),
        );
      },
    );
  }
}

class FramyProfilePageCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_ProfilePage_Page'),
      dependencies: [
        FramyDependencyModel<User>('User', 'User', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return MultiProvider(
          providers: [
            Provider<User>.value(value: valueGetter('User')),
          ],
          child: ProfilePage(),
        );
      },
    );
  }
}

class FramyDummyTestWidgetCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_DummyTestWidget_Page'),
      dependencies: [
        FramyDependencyModel<DummyTestWidgetModel>(
            'model', 'DummyTestWidgetModel', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return DummyTestWidget(
          model: valueGetter('model'),
        );
      },
    );
  }
}

class FramyUserDataCardCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_UserDataCard_Page'),
      dependencies: [
        FramyDependencyModel<User>('user', 'User', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return UserDataCard(
          user: valueGetter('user'),
        );
      },
    );
  }
}

class FramyUserEmailsViewCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_UserEmailsView_Page'),
      dependencies: [
        FramyDependencyModel<User>('user', 'User', null),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return UserEmailsView(
          user: valueGetter('user'),
        );
      },
    );
  }
}

class FramyWeightUnitDisplayCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_WeightUnitDisplay_Page'),
      dependencies: [
        FramyDependencyModel<WeightUnit>(
            'weightUnit', 'WeightUnit', WeightUnit.kg),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return WeightUnitDisplay(
          weightUnit: valueGetter('weightUnit'),
        );
      },
    );
  }
}

class FramyWeightEntryListItemCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FramyCustomPage(
      key: Key('Framy_WeightEntryListItem_Page'),
      dependencies: [
        FramyDependencyModel<WeightEntry>('weightEntry', 'WeightEntry', null),
        FramyDependencyModel<double>('weightDifference', 'double', 0),
      ],
      builder: (DependencyValueGetter valueGetter) {
        return WeightEntryListItem(
          weightEntry: valueGetter('weightEntry'),
          weightDifference: valueGetter('weightDifference'),
        );
      },
    );
  }
}

class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  T lastCustomValue;
  String constructor;
  List<FramyDependencyModel> subDependencies;

  FramyDependencyModel(this.name, this.type, this.value,
      {this.subDependencies, this.constructor}) {
    if (constructor == null) {
      constructor = framyAvailableConstructorNames[type]?.first ?? '';
    }
    if (subDependencies == null) {
      subDependencies = createSubDependencies(type, constructor);
    }
    if (value == null) {
      updateValue();
    }
    lastCustomValue = value;
  }

  String get listType => type.substring(
        type.indexOf('<') + 1,
        type.lastIndexOf('>'),
      );

  void updateValue() {
    if (type.startsWith('List<')) {
      value = initList(listType);
    } else {
      value = framyModelConstructorMap[type]?.call(this);
    }
    lastCustomValue = value;
  }
}

class FramyWidgetDependenciesPanel extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
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
          child: Padding(
            padding: const EdgeInsets.all(8),
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
      ),
    );
  }
}

class FramyWidgetDependenciesFAB extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
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
                  onChanged: (dep) {
                    setState(() {});
                    onChanged(dep);
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

class FramyStoryBoardPage extends StatelessWidget {
  const FramyStoryBoardPage() : super(key: const Key('FramyStoryBoardPage'));

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.all(16),
      maxCrossAxisExtent: 300,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 2,
      children: [
        FramyStoryboardCustomPageWithDependencies(
          dependencies: [
            FramyDependencyModel<List<WeightEntry>>(
                'weightEntries', 'List<WeightEntry>', null),
          ],
          builder: (DependencyValueGetter valueGetter) {
            return HistoryPage(
              weightEntries: valueGetter('weightEntries'),
            );
          },
        ),
        FramyStoryboardCustomPageWithDependencies(
          dependencies: [
            FramyDependencyModel<StatisticsPageState>(
                'state', 'StatisticsPageState', null),
          ],
          builder: (DependencyValueGetter valueGetter) {
            return StatisticsPage(
              state: valueGetter('state'),
            );
          },
        ),
        FramyStoryboardCustomPageWithDependencies(
          dependencies: [
            FramyDependencyModel<User>('User', 'User', null),
          ],
          builder: (DependencyValueGetter valueGetter) {
            return MultiProvider(
              providers: [
                Provider<User>.value(value: valueGetter('User')),
              ],
              child: ProfilePage(),
            );
          },
        ),
        FramyStoryboardCustomPageWithDependencies(
          dependencies: [
            FramyDependencyModel<List<WeightEntry>>(
                'weightEntries', 'List<WeightEntry>', null),
          ],
          builder: (DependencyValueGetter valueGetter) {
            return HistoryPage(
              weightEntries: valueGetter('weightEntries'),
            );
          },
        ),
      ],
    );
  }
}

class FramyStoryboardCustomPageWithDependencies extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final Widget Function(DependencyValueGetter dependencyValueGetter) builder;

  const FramyStoryboardCustomPageWithDependencies(
      {Key key, this.dependencies, this.builder})
      : super(key: key);

  FramyDependencyModel dependency(String name) =>
      dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(16),
      ),
      child: builder(dependencyValue),
    );
  }
}

// ======================== DEPENDENCY INPUTS ===========================

InputDecoration get _framyInputDecoration => InputDecoration(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );

class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final Widget trailing;

  const FramyWidgetDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets, this.trailing})
      : super(key: key);

  void _onValueChanged(dynamic value) {
    if (value != null && !isValueAPreset(presets, dependency.type, value)) {
      dependency.lastCustomValue = value;
    }
    dependency.value = value;
    onChanged(dependency);
  }

  @override
  Widget build(BuildContext context) {
    final inputKey = Key('framy_dependency_${dependency.name}_input');
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dependency.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  if (trailing != null) trailing,
                ],
              ),
              FramyPresetDropdown(
                dependency: dependency,
                onChanged: _onValueChanged,
                presets: presets,
              ),
            ],
          ),
        ),
        if (!isDependencyAPreset(presets, dependency) &&
            framyAvailableConstructorNames.containsKey(dependency.type) &&
            framyAvailableConstructorNames[dependency.type].length > 1)
          FramyConstructorDropdown(
            dependency: dependency,
            onChanged: onChanged,
          ),
        if (!isDependencyAPreset(presets, dependency))
          if (dependency.type == 'bool')
            InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<bool>(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
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
                ),
              ),
            )
          else if (dependency.type == 'String' ||
              dependency.type == 'int' ||
              dependency.type == 'double')
            TextFormField(
              key: inputKey,
              decoration: _framyInputDecoration,
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
                  _onValueChanged(valueToReturn);
                }
              },
            )
          else if (dependency.type == 'DateTime')
            FramyDateTimeDependencyInput(
              key: inputKey,
              dependency: dependency,
              presets: presets,
              onChanged: _onValueChanged,
            )
          else if (dependency.type == 'User' ||
              dependency.type == 'StatisticsPageState' ||
              dependency.type == 'WeightEntry')
            FramyModelInput(
              key: inputKey,
              dependencies: dependency.subDependencies,
              presets: presets,
              onChanged: (_) => _onValueChanged(
                framyModelConstructorMap[dependency.type]?.call(dependency),
              ),
            )
          else if (dependency.type.startsWith('List<'))
            FramyWidgetListDependencyInput(
              dependency: dependency,
              onChanged: (_) => _onValueChanged(dependency.value),
              presets: presets,
            )
          else if (framyEnumMap.containsKey(dependency.type))
            InputDecorator(
              decoration: _framyInputDecoration,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isDense: true,
                  key: inputKey,
                  value: dependency.value,
                  onChanged: _onValueChanged,
                  items: framyEnumMap[dependency.type]
                      .map((enumValue) => DropdownMenuItem(
                            value: enumValue,
                            child: Text(enumValue.toString().substring(
                                enumValue.toString().indexOf('.') + 1)),
                          ))
                      .toList(),
                ),
              ),
            )
          else
            Text('Not supported type'),
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
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: dependencies
            .map((dep) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 2),
                      child: Text('•'),
                    ),
                    Expanded(
                      child: FramyWidgetDependencyInput(
                        dependency: dep,
                        presets: presets,
                        onChanged: (changedDep) {
                          onChanged(dependencies);
                        },
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class FramyDateTimeDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<dynamic> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyDateTimeDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = dependency.value == null
        ? '-'
        : (dependency.value as DateTime)
            .toIso8601String()
            .replaceFirst('T', ' ')
            .replaceFirst(RegExp('\\..*'), '');
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: dependency.value ?? DateTime.now(),
          firstDate: DateTime(1000),
          lastDate: DateTime(3000),
        ).then((value) {
          if (value != null) {
            onChanged(value);
          }
        });
      },
      child: InputDecorator(
        decoration: _framyInputDecoration.copyWith(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(text),
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
    return Column(
      key: Key(dependency.value?.length?.toString()),
      children: [
        if (dependency.value != null)
          for (int i = 0; i < dependency.value.length; i++)
            FramyWidgetDependencyInput(
              dependency: FramyDependencyModel(
                'List element ${i + 1}',
                dependency.listType,
                dependency.value[i],
                subDependencies: dependency.subDependencies[i].subDependencies,
                constructor: dependency.subDependencies[i].constructor,
              ),
              onChanged: (changedDep) {
                dependency.value[i] = changedDep.value;
                dependency.subDependencies[i].constructor =
                    changedDep.constructor;
                dependency.subDependencies[i].subDependencies =
                    changedDep.subDependencies;
                onChanged(dependency);
              },
              presets: presets,
              trailing: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  key: Key(
                      'framy_dependency_List element ${i + 1}_delete_button'),
                  icon: Icon(Icons.close),
                  iconSize: 16,
                  onPressed: () {
                    dependency.value.removeAt(i);
                    dependency.subDependencies.removeAt(i);
                    onChanged(dependency);
                  },
                  // splashRadius: 16, //--not in Stable channel yet
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tightFor(
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
        FlatButton(
          child: Text('+ Add ${dependency.name} element'),
          onPressed: () {
            if (dependency.value == null) {
              dependency.value = initList(dependency.listType);
            }
            final newModel = FramyDependencyModel<dynamic>(
              '_',
              dependency.listType,
              null,
            );
            dependency.subDependencies.add(newModel);
            dependency.value.add(newModel.value);
            onChanged(dependency);
          },
        ),
      ],
    );
  }
}

dynamic initList(String listType) {
  if (listType == 'String') return <String>[];
  if (listType == 'int') return <int>[];
  if (listType == 'double') return <double>[];
  if (listType == 'bool') return <bool>[];
  if (listType == 'WeightUnit') return <WeightUnit>[];
  if (listType == 'User') return <User>[];
  if (listType == 'StatisticsPageState') return <StatisticsPageState>[];
  if (listType == 'WeightEntry')
    return <WeightEntry>[];
  else
    return [];
}

class FramyPresetDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyPresetDropdown(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customValue = dependency.value;
    if (customValue == null || isDependencyAPreset(presets, dependency)) {
      customValue = framyModelConstructorMap[dependency.type]?.call(dependency);
    }
    return DropdownButton(
      key: Key('framy_${dependency.name}_preset_dropdown'),
      value: dependency.value,
      underline: Container(
        color: Colors.grey.withOpacity(0.2),
        height: 1,
        width: double.infinity,
      ),
      onChanged: (val) {
        if (val == customValue) {
          onChanged(dependency.lastCustomValue ?? customValue);
        } else {
          onChanged(val);
        }
      },
      items: [
        DropdownMenuItem(
          value: null,
          child: Text('Null'),
        ),
        DropdownMenuItem(
          value: customValue,
          child: Text('Custom'),
        ),
        if (presets.containsKey(dependency.type))
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

class FramyConstructorDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;

  FramyConstructorDropdown({this.dependency, this.onChanged})
      : super(
          key: Key('framy_dependency_${dependency.name}_constructor_dropdown'),
        );

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Constructor',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: dependency.constructor,
          onChanged: (conName) {
            dependency.constructor = conName;
            dependency.subDependencies =
                createSubDependencies(dependency.type, dependency.constructor);
            dependency.updateValue();
            onChanged(dependency);
          },
          items: framyAvailableConstructorNames[dependency.type]
              .map((constructorName) => DropdownMenuItem<String>(
                    value: constructorName,
                    child: Text(constructorName.isEmpty
                        ? 'Default'
                        : constructorName.replaceAll('.', '')),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

// ======================== MAPS etc ===========================

final framyModelConstructorMap =
    <String, dynamic Function(FramyDependencyModel)>{
  ...framyEnumMap.map((type, values) =>
      MapEntry(type, (FramyDependencyModel dep) => values.first)),
  'User': (dep) {
    if (dep.constructor == '') {
      return User(
        dep.subDependencies.singleWhere((d) => d.name == 'firstName').value,
        dep.subDependencies.singleWhere((d) => d.name == 'lastName').value,
        dep.subDependencies.singleWhere((d) => d.name == 'age').value,
        emails:
            dep.subDependencies.singleWhere((d) => d.name == 'emails').value,
      );
    } else
      return null;
  },
  'StatisticsPageState': (dep) {
    if (dep.constructor == '.loaded') {
      return StatisticsPageState.loaded(
        dep.subDependencies.singleWhere((d) => d.name == 'weightEntries').value,
      );
    }
    if (dep.constructor == '.loading') {
      return StatisticsPageState.loading();
    }
    if (dep.constructor == '.error') {
      return StatisticsPageState.error(
        dep.subDependencies.singleWhere((d) => d.name == 'message').value,
      );
    } else
      return null;
  },
  'WeightEntry': (dep) {
    if (dep.constructor == '') {
      return WeightEntry(
        dep.subDependencies.singleWhere((d) => d.name == 'dateTime').value,
        dep.subDependencies.singleWhere((d) => d.name == 'weight').value,
        dep.subDependencies.singleWhere((d) => d.name == 'note').value,
      );
    }
    if (dep.constructor == '.now') {
      return WeightEntry.now(
        dep.subDependencies.singleWhere((d) => d.name == 'weight').value,
      );
    } else
      return null;
  },
  'String': (dep) => '',
  'double': (dep) => 0.0,
  'int': (dep) => 0,
  'bool': (dep) => false,
};

final framyEnumMap = <String, List<dynamic>>{
  'MaterialTapTargetSize': MaterialTapTargetSize.values,
  'WeightUnit': WeightUnit.values,
};
List<FramyDependencyModel> createSubDependencies(String type,
    [String constructor = '']) {
  switch (type + constructor) {
    case 'User':
      return [
        FramyDependencyModel<String>('firstName', 'String', null),
        FramyDependencyModel<String>('lastName', 'String', null),
        FramyDependencyModel<int>('age', 'int', null),
        FramyDependencyModel<List<String>>('emails', 'List<String>', null),
      ];

    case 'StatisticsPageState.loaded':
      return [
        FramyDependencyModel<List<WeightEntry>>(
            'weightEntries', 'List<WeightEntry>', null),
      ];
    case 'StatisticsPageState.loading':
      return [];
    case 'StatisticsPageState.error':
      return [
        FramyDependencyModel<String>('message', 'String', null),
      ];

    case 'WeightEntry':
      return [
        FramyDependencyModel<DateTime>('dateTime', 'DateTime', null),
        FramyDependencyModel<double>('weight', 'double', null),
        FramyDependencyModel<String>('note', 'String', null),
      ];
    case 'WeightEntry.now':
      return [
        FramyDependencyModel<double>('weight', 'double', null),
      ];

    default:
      return [];
  }
}

Map<String, List<String>> framyAvailableConstructorNames = {
  'User': [''],
  'StatisticsPageState': ['.loaded', '.loading', '.error'],
  'WeightEntry': ['', '.now'],
};

Map<String, Map<String, dynamic>> createFramyPresets() => {
      'WeightEntry': {
        'presetEntry': presetEntry(),
      },
      'User': {
        'teenageJohn': teenageJohn(),
      },
    };
