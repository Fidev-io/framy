String generateWidgetDependenciesPanel() => '''
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
          builder: (context, setState) => FramyWidgetDependenciesPanel(
            dependencies: dependencies,
            presets: presets,
            onChanged: (s, v) {
              setState(() {});
              onChanged(s, v);
            },
          ),
        ),
      ),
      mini: true,
    );
  }
}
''';
