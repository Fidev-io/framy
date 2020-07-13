// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_value_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BuiltUser extends BuiltUser {
  @override
  final String firstName;
  @override
  final String lastName;

  factory _$BuiltUser([void Function(BuiltUserBuilder) updates]) =>
      (new BuiltUserBuilder()..update(updates)).build();

  _$BuiltUser._({this.firstName, this.lastName}) : super._() {
    if (firstName == null) {
      throw new BuiltValueNullFieldError('BuiltUser', 'firstName');
    }
    if (lastName == null) {
      throw new BuiltValueNullFieldError('BuiltUser', 'lastName');
    }
  }

  @override
  BuiltUser rebuild(void Function(BuiltUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltUserBuilder toBuilder() => new BuiltUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltUser &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, firstName.hashCode), lastName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltUser')
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class BuiltUserBuilder implements Builder<BuiltUser, BuiltUserBuilder> {
  _$BuiltUser _$v;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  BuiltUserBuilder();

  BuiltUserBuilder get _$this {
    if (_$v != null) {
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltUser;
  }

  @override
  void update(void Function(BuiltUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltUser build() {
    final _$result =
        _$v ?? new _$BuiltUser._(firstName: firstName, lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
