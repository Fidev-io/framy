import 'package:framy_annotation/framy_annotation.dart';

@framyModel
class WeightEntry {
  final double weight;
  final DateTime dateTime;
  final String note;

  WeightEntry(this.dateTime, this.weight, this.note);
}
