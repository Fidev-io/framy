import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:weight_tracker/widgets/weight_entry_list_item.dart';

@framyWidget
class HistoryPage extends StatelessWidget {
  final List<WeightEntry> weightEntries;

  const HistoryPage({Key key, @required this.weightEntries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weightEntries?.isEmpty ?? true) {
      return Center(
        child: Text('No entries'),
      );
    }
    return ListView.builder(
      itemCount: weightEntries.length,
      itemBuilder: (context, index) {
        return WeightEntryListItem(weightEntry: weightEntries[index]);
      },
    );
  }
}
