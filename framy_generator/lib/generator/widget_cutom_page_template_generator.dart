String generateCustomPage(bool useDevicePreview) => '''
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
                child: ${_generateWidgetBuilderUsage(useDevicePreview)}
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
''';

String _generateWidgetBuilderUsage(bool useDevicePreview) {
  String builder = '''
builder: (context) {   
  Widget widgetToDisplay = ${_widgetBuilderUsage};
  if (settings.wrapWithCenter) {
    widgetToDisplay = Center(key: ValueKey('FramyGeneratedCenter'), child: widgetToDisplay,);
  }
  if (settings.wrapWithSafeArea) {
    widgetToDisplay = SafeArea(key: ValueKey('FramyGeneratedSafeArea'), child: widgetToDisplay,);
  }
  if (settings.wrapWithScaffold) {
    widgetToDisplay = Scaffold(key: ValueKey('FramyGeneratedScaffold'), body: widgetToDisplay,);
  }
  return widgetToDisplay;
},
''';
  if (useDevicePreview) {
    return '''
DevicePreview(
  enabled: FramyAppSettings.of(context).wrapWithDevicePreview,
  style: DevicePreviewStyle(
    toolBar: DevicePreviewToolBarStyle.light(
      position: DevicePreviewToolBarPosition.right,
    ),
    background: BoxDecoration(),
  ),
  $builder
),
''';
  } else {
    return '''
Builder(
  $builder 
),    
''';
  }
}

String _widgetBuilderUsage = 'widget.builder(dependencyValue)';
