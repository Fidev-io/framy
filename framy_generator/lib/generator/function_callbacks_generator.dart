String generateFunctionCallbacks() => '''
dynamic getFunctionCallback(FramyDependencyModel dependency) {
  final callbacks = [
    () => dependency.functionCalls.addCall(dependency.name, []),
    (a) => dependency.functionCalls.addCall(dependency.name, [a]),
    (a, b) => dependency.functionCalls.addCall(dependency.name, [a, b]),
    (a, b, c) => dependency.functionCalls.addCall(dependency.name, [a, b, c]),
    (a, b, c, d) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d]),
    (a, b, c, d, e) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d, e]),
    (a, b, c, d, e, f) =>
        dependency.functionCalls.addCall(dependency.name, [a, b, c, d, e, f]),
  ];
  if (dependency.type.contains('()')) {
    return callbacks[0];
  } else {
    return callbacks[','.allMatches(dependency.type).length + 1];
  }
}
''';
