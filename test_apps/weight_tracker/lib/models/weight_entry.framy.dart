import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';

@framyPreset
WeightEntry presetEntry() => WeightEntry.now(70);
