String generateDependencyModel() => '''
class FramyDependencyModel<T> {
  final String name;
  final String type;
  T value;
  T lastCustomValue;
  String constructor;
  List<FramyDependencyModel> subDependencies;
  final functionCalls = FramyDependencyFunctionCallsList();

  FramyDependencyModel(this.name, this.type, this.value,
      {this.subDependencies, this.constructor}) {
    if (constructor == null) {
      constructor = framyAvailableConstructorNames[type]?.first ?? '';
    }
    if (subDependencies == null) {
      subDependencies = createSubDependencies(type, constructor);
    }
    if (value == null) {
      updateValue();
    }
    lastCustomValue = value;
  }

  bool get isFunction => type.contains('Function(');

  String get listType => type.substring(
        type.indexOf('<') + 1,
        type.lastIndexOf('>'),
      );

  void updateValue() {
    if (type.startsWith('List<')) {
      value = initList(listType);
    } else if (isFunction) {
      value = getFunctionCallback(this);
    } else {
      value = framyModelConstructorMap[type]?.call(this);
    }
    lastCustomValue = value;
  }
}

class FramyDependencyFunctionCallsList with ChangeNotifier {
  final List<FramyDependencyFunctionCall> calls = [];

  void addCall(functionName, params) {
    calls.add(FramyDependencyFunctionCall(functionName, params));
    notifyListeners();
  }
}

class FramyDependencyFunctionCall {
  final DateTime time;
  final List<dynamic> params;
  final String functionName;

  FramyDependencyFunctionCall(this.functionName, this.params)
      : time = DateTime.now();
}
''';
