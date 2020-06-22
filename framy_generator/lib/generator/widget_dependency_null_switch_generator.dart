String generateWidgetDependencyNullSwitch() => '''
class FramyWidgetDependencyNullSwitch extends StatelessWidget {
  final dynamic value;
  final ValueChanged<dynamic> onChanged;

  const FramyWidgetDependencyNullSwitch({Key key, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value == null,
      onChanged: (bool value) => onChanged(null),
    );
  }
}
''';
