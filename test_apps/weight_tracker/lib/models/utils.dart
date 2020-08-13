DateTime mockDateTime;

extension CustomizableDateTime on DateTime {
  DateTime get current => mockDateTime ?? DateTime.now();
}
