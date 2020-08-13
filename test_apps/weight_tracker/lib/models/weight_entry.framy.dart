import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';

import 'utils.dart';

@framyPreset
WeightEntry presetEntry() =>
    WeightEntry(DateTime(2020, 9, 5), 70.0, 'Some note');

@framyPreset
List<WeightEntry> emptyList() => [];

@framyPreset
List<WeightEntry> singleElementToday() => [WeightEntry.now(70.0)];

@framyPreset
List<WeightEntry> fewElementsSameDay() => [
      WeightEntry(DateTime.now().current, 50.0, ''),
      WeightEntry(DateTime.now().current.add(Duration(minutes: 10)), 60.0, ''),
      WeightEntry(DateTime.now().current.add(Duration(minutes: 20)), 70.0, ''),
    ];

@framyPreset
List<WeightEntry> monthFullOfEntries() => List.generate(
      31,
      (index) => WeightEntry(
          DateTime.now().current.subtract(Duration(days: index)),
          90 - index * 0.5,
          'day $index'),
    );

@framyPreset
List<WeightEntry> oneEntryTwoMonthsAgo() => [
      WeightEntry(
          DateTime.now().current.subtract(Duration(days: 61)), 70.0, ''),
    ];

@framyPreset
List<WeightEntry> oneNowOneTwoMonthsAgo() => [
      WeightEntry(
          DateTime.now().current.subtract(Duration(days: 61)), 80.0, ''),
      WeightEntry(DateTime.now().current, 60.0, ''),
    ];
