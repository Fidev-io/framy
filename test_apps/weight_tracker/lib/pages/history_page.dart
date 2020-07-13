import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:weight_tracker/widgets/weight_entry_list_item.dart';

@FramyRegisterRiverpod()
final weightEntries = Provider((ref) => [
      WeightEntry(DateTime(2020, 07, 01), 79, ''),
      WeightEntry(DateTime(2020, 07, 02), 78.6, ''),
      WeightEntry(DateTime(2020, 07, 03), 78.3, ''),
    ]);

@FramyUseRiverpod('weightEntries')
@FramyWidget(isPage: true)
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer((context, read) {
      final entries = read(weightEntries);
      if (entries?.isEmpty ?? true) {
        return Center(
          child: Text('No entries'),
        );
      }
      return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return WeightEntryListItem(weightEntry: entries[index]);
        },
      );
    });
  }
}
