import 'package:framy_annotation/framy_annotation.dart';

@framyModel
class User {
  final String firstName;
  final String lastName;
  final int age;

  User(this.firstName, this.lastName, this.age);
}
