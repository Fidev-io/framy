String generateWidgetDependencyNullSwitch() => '''
class FramyWidgetDependencyNullSwitch extends StatelessWidget {
  final dynamic value;

  const FramyWidgetDependencyNullSwitch({Key key, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value == null,
      onChanged: (bool value) {},
    );
  }
}
''';
