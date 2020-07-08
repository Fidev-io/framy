String generateConstructorDropdown() => '''
class FramyConstructorDropdown extends StatelessWidget {
  final FramyDependencyModel dependency;
  final ValueChanged<FramyDependencyModel> onChanged;

  FramyConstructorDropdown({this.dependency, this.onChanged})
      : super(
          key: Key('framy_dependency_\${dependency.name}_constructor_dropdown'),
        );

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Constructor',
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: dependency.constructor,
          onChanged: (conName) {
            dependency.constructor = conName;
            dependency.subDependencies =
                createSubDependencies(dependency.type, dependency.constructor);
            dependency.updateValue();
            onChanged(dependency);
          },
          items: framyAvailableConstructorNames[dependency.type]
              .map((constructorName) => DropdownMenuItem<String>(
                    value: constructorName,
                    child: Text(constructorName.isEmpty
                        ? 'Default'
                        : constructorName.replaceAll('.', '')),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
''';
