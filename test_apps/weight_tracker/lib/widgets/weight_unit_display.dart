import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_unit.dart';

@FramyWidget()
class WeightUnitDisplay extends StatelessWidget {
  final WeightUnit weightUnit;

  const WeightUnitDisplay({Key key, this.weightUnit = WeightUnit.kg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Weight unit'),
      trailing: Text(weightUnit == null
          ? 'Default'
          : (weightUnit == WeightUnit.lbs ? 'lbs' : 'kg')),
    );
  }
}
