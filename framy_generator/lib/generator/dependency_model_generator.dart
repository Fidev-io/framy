String generateDependencyModel() => '''
class FramyDependencyModel<T> {
  final String name;
  final FramyDependencyType type;
  T value;

  FramyDependencyModel(this.name, this.type, this.value);
}

enum FramyDependencyType { string, int, bool, num }
''';
