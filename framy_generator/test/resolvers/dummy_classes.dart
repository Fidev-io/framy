class Color {
  final int value;
  const Color(int value) : value = value & 0xFFFFFFFF;
}

class MaterialColor extends Color {
  const MaterialColor(int value) : super(value);
}

class MaterialAccentColor extends Color {
  const MaterialAccentColor(int value) : super(value);
}

class ThemeData {
  final Color errorColor;

  ThemeData({this.errorColor});
}

class Key {}

class User {
  String firstName;
}

class Provider<T> {
  final T Function(dynamic x) create;

  Provider(this.create);
}
