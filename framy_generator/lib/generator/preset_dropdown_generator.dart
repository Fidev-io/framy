String generatePresetDropdown() => '''
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
      if (dependency.isFunction) {
        customValue = getFunctionCallback(dependency);
      } else {
        customValue = framyModelConstructorMap[dependency.type]?.call(dependency);
      }
    }
    return DropdownButton(
      key: Key('framy_\${dependency.name}_preset_dropdown'),
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
          child: Text(dependency.isFunction ? 'Logger' : 'Custom'),
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
''';
