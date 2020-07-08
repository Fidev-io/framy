import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:weight_tracker/models/statistics_page_state.dart';

@framyWidget
class StatisticsPage extends StatelessWidget {
  final StatisticsPageState state;

  const StatisticsPage({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: state.when(
        loaded: (entries) {
          final sortedEntries = [...entries]
            ..sort((a, b) => a.dateTime?.compareTo(b.dateTime) ?? 0);
          final currentWeight =
              sortedEntries.isEmpty ? 0 : sortedEntries.first.weight;
          return Text('Current weight: $currentWeight');
        },
        loading: () => CircularProgressIndicator(
          key: Key('loading'),
        ),
        error: (message) => Text(
          '$message',
          style: TextStyle(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}
