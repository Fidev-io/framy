String generateDependencyModel() => '''
class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  T lastCustomValue;
  String constructor;
  List<FramyDependencyModel> subDependencies;

  FramyDependencyModel(this.name, this.type, this.value, this.subDependencies,
        {this.constructor = ''})
        : lastCustomValue = value;
}
''';
