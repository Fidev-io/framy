String generateDependencyModel() => '''
class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  final List<FramyDependencyModel> subDependencies;
  T lastCustomValue;

  FramyDependencyModel(this.name, this.type, this.value, this.subDependencies)
        : lastCustomValue = value;
}
''';
