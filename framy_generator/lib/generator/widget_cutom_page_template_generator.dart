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

  FramyDependencyModel dependency(String name) =>
      widget.dependencies.singleWhere((d) => d.name == name);

  dynamic dependencyValue(String name) => dependency(name).value;

  void onChanged(String name, dynamic dependencyValue) {
    setState(() => dependency(name).value = dependencyValue);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ${_generateWidgetBuilderUsage(useDevicePreview)}
              ),
              if (!isSmallDevice)
                SizedBox(
                  width: 300,
                  child: FramyWidgetDependenciesPanel(
                    dependencies: widget.dependencies,
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
                dependencies: widget.dependencies,
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
  if (useDevicePreview) {
    return '''
DevicePreview(
  style: DevicePreviewStyle(
    toolBar: DevicePreviewToolBarStyle.light(
      position: DevicePreviewToolBarPosition.right,
    ),
    background: BoxDecoration(),
  ),
  builder: (context) => Scaffold(
    body: ${_widgetBuilderUsage}
  ),
),
''';
  } else {
    return _widgetBuilderUsage;
  }
}

String _widgetBuilderUsage = 'widget.builder(dependencyValue),';
