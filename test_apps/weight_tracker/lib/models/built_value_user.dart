import 'package:built_value/built_value.dart';
import 'package:framy_annotation/framy_annotation.dart';

part 'built_value_user.g.dart';

@framyModel
abstract class BuiltUser implements Built<BuiltUser, BuiltUserBuilder> {
  String get firstName;

  String get lastName;

  BuiltUser._();

  factory BuiltUser([updates(BuiltUserBuilder b)]) = _$BuiltUser;
}
