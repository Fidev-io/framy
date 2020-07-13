import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/built_value_user.dart';

@framyWidget
class BuiltValueExampleWidget extends StatelessWidget {
  final BuiltUser user;

  const BuiltValueExampleWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${user.firstName}\n${user.lastName}',
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
    );
  }
}
