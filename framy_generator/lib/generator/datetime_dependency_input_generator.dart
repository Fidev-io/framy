String generateDateTimeDependencyInput() => '''
class FramyDateTimeDependencyInput extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<dynamic> onChanged;
  final Map<String, Map<String, dynamic>> presets;

  const FramyDateTimeDependencyInput(
      {Key key, this.dependency, this.onChanged, this.presets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = dependency.value == null
        ? '-'
        : (dependency.value as DateTime)
            .toIso8601String()
            .replaceFirst('T', ' ')
            .replaceFirst(RegExp('\\\\..*'), '');
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: dependency.value ?? DateTime.now(),
          firstDate: DateTime(1000),
          lastDate: DateTime(3000),
        ).then((value) {
          if (value != null) {
            onChanged(value);
          }
        });
      },
      child: InputDecorator(
        decoration: _framyInputDecoration.copyWith(
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(text),
      ),
    );
  }
}
''';
