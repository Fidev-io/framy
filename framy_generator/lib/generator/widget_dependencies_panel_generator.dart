String generateWidgetDependenciesPanel() => '''
class FramyWidgetDependenciesPanel extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final int tabIndex;
  final ValueChanged<int> onTabIndexChanged;

  const FramyWidgetDependenciesPanel(
      {Key key,
      this.dependencies,
      this.onChanged,
      this.presets,
      this.tabIndex = 0,
      this.onTabIndexChanged})
      : super(key: const Key('FramyWidgetDependenciesPanel'));

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Expanded(
              child: tabIndex == 0
                  ? FramyDependenciesTab(
                      dependencies: dependencies,
                      onChanged: onChanged,
                      presets: presets,
                    )
                  : FramyCallbacksTab(dependencies: dependencies),
            ),
            if (dependencies.any((model) => model.type.contains('Function(')))
              BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: tabIndex,
                onTap: onTabIndexChanged,
                items: [
                  BottomNavigationBarItem(
                    label: 'Dependencies',
                    icon: Icon(Icons.settings_applications),
                  ),
                  BottomNavigationBarItem(
                    label: 'Callbacks',
                    icon: Icon(Icons.list),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class FramyCallbacksTab extends StatefulWidget {
  final List<FramyDependencyModel> dependencies;

  const FramyCallbacksTab({Key key, this.dependencies}) : super(key: key);

  @override
  _FramyCallbacksTabState createState() => _FramyCallbacksTabState();
}

class _FramyCallbacksTabState extends State<FramyCallbacksTab> {
  @override
  void initState() {
    super.initState();
    widget.dependencies.forEach((element) {
      element.functionCalls.addListener(_onCallsChanged);
    });
  }

  @override
  void dispose() {
    widget.dependencies.forEach((element) {
      element.functionCalls.removeListener(_onCallsChanged);
    });
    super.dispose();
  }

  void _onCallsChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final callbacks = widget.dependencies
        .fold<List<FramyDependencyFunctionCall>>(
            <FramyDependencyFunctionCall>[],
            (prev, dep) => prev..addAll(dep.functionCalls.calls))
          ..sort((a, b) => b.time.compareTo(a.time));
    return ListView.builder(
      itemCount: callbacks.length,
      itemBuilder: (context, index) {
        final callback = callbacks[index];
        return ListTile(
          dense: true,
          title: Row(
            children: [
              Text(callback.functionName),
              Spacer(),
              Text(
                  '\${callback.time.hour.toString().padLeft(2, '0')}:\${callback.time.minute.toString().padLeft(2, '0')}:\${callback.time.millisecond.toString().padLeft(3, '0')}')
            ],
          ),
          subtitle: Column(
            children: callback.params.map((param) => Text('• \$param')).toList(),
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        );
      },
    );
  }
}

class FramyDependenciesTab extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyDependenciesTab(
      {Key key, this.dependencies, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class FramyWidgetDependenciesFAB extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final ValueChanged<FramyDependencyModel> onChanged;
  final Map<String, Map<String, dynamic>> presets;
  final int tabIndex;
  final ValueChanged<int> onTabIndexChanged;

  const FramyWidgetDependenciesFAB(
      {Key key,
      this.onChanged,
      this.dependencies,
      this.presets,
      this.tabIndex = 0,
      this.onTabIndexChanged})
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
        builder: (context) {
          int _tabIndex;
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
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
                      tabIndex: _tabIndex ?? tabIndex,
                      onTabIndexChanged: (index) {
                        setState(() => _tabIndex = index);
                        onTabIndexChanged(index);
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      mini: true,
    );
  }
}
''';
