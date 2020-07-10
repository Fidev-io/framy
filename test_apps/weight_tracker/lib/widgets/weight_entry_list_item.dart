import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/models/weight_entry.dart';

@framyWidget
class WeightEntryListItem extends StatelessWidget {
  final WeightEntry weightEntry;
  final double weightDifference;

  const WeightEntryListItem(
      {Key key, @required this.weightEntry, this.weightDifference = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = weightEntry?.dateTime ?? DateTime.now();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat.MMMEd().format(dateTime),
                        textScaleFactor: 0.9,
                      ),
                      Text(
                        TimeOfDay.fromDateTime(dateTime).format(context),
                        textScaleFactor: 0.8,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                if (weightEntry?.note?.isNotEmpty ?? false)
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Icon(
                      Icons.speaker_notes,
                      color: Colors.grey[300],
                      size: 16.0,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            weightEntry?.weight?.toStringAsFixed(1) ?? 'No data',
            textScaleFactor: 2.0,
          ),
          Expanded(
            child: Text(
              _differenceText,
              textScaleFactor: 1.6,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  String get _differenceText {
    if (weightDifference == null || weightDifference == 0) {
      return '-';
    } else if (weightDifference > 0) {
      return "+" + weightDifference.toStringAsFixed(1);
    } else {
      return weightDifference.toStringAsFixed(1);
    }
  }
}
