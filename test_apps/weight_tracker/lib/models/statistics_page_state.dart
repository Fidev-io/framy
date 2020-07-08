import 'package:framy_annotation/framy_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';

part 'statistics_page_state.freezed.dart';

@framyModel
@freezed
abstract class StatisticsPageState with _$StatisticsPageState {
  const factory StatisticsPageState.loaded(List<WeightEntry> weightEntries) =
      Loaded;

  const factory StatisticsPageState.loading() = Loading;

  const factory StatisticsPageState.error([String message]) = Error;
}
