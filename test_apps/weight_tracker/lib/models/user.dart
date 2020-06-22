import 'package:framy_annotation/framy_annotation.dart';

@framyModel
class User {
  final String firstName;
  final String lastName;
  final int age;
  final List<String> emails;

  User(this.firstName, this.lastName, this.age, {this.emails});
}
