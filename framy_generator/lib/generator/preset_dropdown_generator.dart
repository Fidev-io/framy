String generatePresetDropdown() => '''
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
      key: Key('framy_\${dependency.name}_preset_dropdown'),
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
''';
