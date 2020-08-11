import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';

@framyPreset
WeightEntry presetEntry() =>
    WeightEntry(DateTime(2020, 9, 5), 70.0, 'Some note');
