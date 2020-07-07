String generateDependencyModel() => '''
class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  T lastCustomValue;
  String constructor;
  List<FramyDependencyModel> subDependencies;

  FramyDependencyModel(this.name, this.type, this.value, this.subDependencies,
      {this.constructor = ''}) {
    if (value == null) {
      updateValue();
    }
    lastCustomValue = value;
  }

  String get listType => type.substring(
        type.indexOf('<') + 1,
        type.lastIndexOf('>'),
      );

  void updateValue() {
    if (type.startsWith('List<')) {
      value = initList(listType);
    } else {
      value = framyModelConstructorMap[type]?.call(this);
    }
    lastCustomValue = value;
  }
}
''';
