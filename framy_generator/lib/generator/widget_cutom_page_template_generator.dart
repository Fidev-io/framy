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
  int currentTabIndex = 0;
  double dependenciesPanelWidth = 300;
  
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
                  width: dependenciesPanelWidth,
                  height: double.infinity,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned.fill(
                        child: FramyWidgetDependenciesPanel(
                          dependencies: dependencies,
                          presets: presets,
                          onChanged: onChanged,
                          tabIndex: currentTabIndex,
                          onTabIndexChanged: (index) =>
                              setState(() => currentTabIndex = index),
                        ),
                      ),
                      _buildResizeDragHandle(constraints),
                    ],
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
                tabIndex: currentTabIndex,
                onTabIndexChanged: (index) => setState(() => currentTabIndex = index),
              ),
            );
          } else {
            return body;
          }
        },
      ),
    );
  }
  
  Widget _buildResizeDragHandle(BoxConstraints constraints) {
    return GestureDetector(
      key: Key('FramyDependenciesPanelDragHandle'),
      onHorizontalDragUpdate: (det) {
        setState(() {
          dependenciesPanelWidth -= det.delta.dx;
          dependenciesPanelWidth = dependenciesPanelWidth.clamp(200.0, constraints.maxWidth * 0.7);
        });
      },
      child: InkWell(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(4),
            ),
          ),
          color: Theme.of(context).accentColor.withOpacity(0.5),
          child: Container(
            width: 8,
            height: 50,
          ),
        ),
      ),
    );
  }
}
''';

String _generateWidgetBuilderUsage(bool useDevicePreview) {
  final builder = '''
builder: (context) {   
  var widgetToDisplay = ${_widgetBuilderUsage};
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
    hasFrameShadow: false,
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
