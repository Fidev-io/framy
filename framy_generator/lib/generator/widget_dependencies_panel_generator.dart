String generateWidgetDependenciesPanel() => '''
class FramyWidgetDependenciesPanel extends StatelessWidget {
  final List<FramyDependencyModel> dependencies;
  final void Function(String name, dynamic value) onChanged;

  const FramyWidgetDependenciesPanel({Key key, this.dependencies, this.onChanged})
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
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class FramyWidgetDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final void Function(String name, dynamic value) onChanged;

  const FramyWidgetDependencyInput({Key key, this.dependency, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dependency.name),
        TextFormField(
          key: Key('framy_dependency_\${dependency.name}_input'),
          initialValue: dependency.value?.toString(),
          onChanged: (s) => onChanged(dependency.name, s),
        ),
      ],
    );
  }
}

class FramyWidgetDependenciesFAB extends StatelessWidget {
  final Widget dependenciesPanel;

  const FramyWidgetDependenciesFAB({Key key, this.dependenciesPanel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'FramyWidgetDependenciesButton',
      child: Icon(Icons.tune),
      key: const Key('FramyWidgetDependenciesButton'),
      onPressed: () => showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        context: context,
        builder: (context) => dependenciesPanel,
      ),
      mini: true,
    );
  }
}
''';
