import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/models/utils.dart';
import 'package:weight_tracker/models/weight_entry.dart';
import 'package:weight_tracker/models/weight_unit.dart';
import 'package:weight_tracker/widgets/progress_chart_utils.dart' as utils;
import 'package:weight_tracker/widgets/progress_chart_utils.dart';

///This code was originally written in 2017. Don't judge me. 🙈

@FramyWidget()
class ProgressChart extends StatefulWidget {
  final List<WeightEntry> weightEntries;

  const ProgressChart({Key key, this.weightEntries}) : super(key: key);

  @override
  ProgressChartState createState() {
    return ProgressChartState();
  }
}

class ProgressChartState extends State<ProgressChart> {
  DateTime startDate;
  DateTime snapShotStartDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now().current.subtract(Duration(days: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: GestureDetector(
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          child: CustomPaint(
            painter: ChartPainter(
              utils.prepareEntryList(widget.weightEntries, startDate),
              daysToDraw(startDate),
              false,
            ),
          ),
        ),
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    setState(() {
      this.snapShotStartDate = this.startDate;
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    int previousNumberOfDays = daysToDraw(snapShotStartDate);
    int newNumberOfDays = (previousNumberOfDays / details.scale).round();
    if (newNumberOfDays >= 7) {
      setState(() {
        startDate = DateTime.now()
            .current
            .subtract(Duration(days: newNumberOfDays - 1));
      });
    }
  }

  int daysToDraw(DateTime date) {
    DateTime now = copyDateWithoutTime(DateTime.now().current);
    DateTime start = copyDateWithoutTime(date);
    return now.difference(start).inDays + 1;
  }
}

class ChartPainter extends CustomPainter {
  final List<WeightEntry> entries;
  final int numberOfDays;
  final bool isLbs;

  ChartPainter(this.entries, this.numberOfDays, this.isLbs);

  double leftOffsetStart;
  double topOffsetEnd;
  double drawingWidth;
  double drawingHeight;

  static const int NUMBER_OF_HORIZONTAL_LINES = 5;

  @override
  void paint(Canvas canvas, Size size) {
    leftOffsetStart = size.width * 0.07;
    topOffsetEnd = size.height * 0.9;
    drawingWidth = size.width * 0.93;
    drawingHeight = topOffsetEnd;

    if (entries.isEmpty) {
      _drawParagraphInsteadOfChart(
          canvas, size, "Add your current weight to see history");
    } else {
      MinMax borderLineValues = _getMinAndMaxValues(entries, isLbs);
      _drawHorizontalLinesAndLabels(
          canvas, size, borderLineValues.min, borderLineValues.max);
      _drawBottomLabels(canvas, size);

      _drawLines(canvas, borderLineValues.min, borderLineValues.max, isLbs);
    }
  }

  @override
  bool shouldRepaint(ChartPainter old) => true;

  ///draws actual chart
  void _drawLines(
      ui.Canvas canvas, int minLineValue, int maxLineValue, bool isLbs) {
    final paint = Paint()
      ..color = Colors.blue[400]
      ..strokeWidth = 3.0;
    DateTime beginningOfChart =
        utils.getStartDateOfChart(DateTime.now().current, numberOfDays);
    for (int i = 0; i < entries.length - 1; i++) {
      Offset startEntryOffset = _getEntryOffset(
          entries[i], beginningOfChart, minLineValue, maxLineValue, isLbs);
      Offset endEntryOffset = _getEntryOffset(
          entries[i + 1], beginningOfChart, minLineValue, maxLineValue, isLbs);
      canvas.drawLine(startEntryOffset, endEntryOffset, paint);
      canvas.drawCircle(endEntryOffset, 3.0, paint);
    }
    canvas.drawCircle(
        _getEntryOffset(
            entries.first, beginningOfChart, minLineValue, maxLineValue, isLbs),
        5.0,
        paint);
  }

  /// Draws horizontal lines and labels informing about weight values attached to those lines
  void _drawHorizontalLinesAndLabels(
      Canvas canvas, Size size, int minLineValue, int maxLineValue) {
    final paint = Paint()..color = Colors.grey[300];
    int lineStep = _calculateHorizontalLineStep(maxLineValue, minLineValue);
    double offsetStep = _calculateHorizontalOffsetStep;
    for (int line = 0; line < NUMBER_OF_HORIZONTAL_LINES; line++) {
      double yOffset = line * offsetStep;
      _drawHorizontalLabel(maxLineValue, line, lineStep, canvas, yOffset);
      _drawHorizontalLine(canvas, yOffset, size, paint);
    }
  }

  void _drawHorizontalLine(
      ui.Canvas canvas, double yOffset, ui.Size size, ui.Paint paint) {
    canvas.drawLine(
      Offset(leftOffsetStart, 5 + yOffset),
      Offset(size.width, 5 + yOffset),
      paint,
    );
  }

  void _drawHorizontalLabel(int maxLineValue, int line, int lineStep,
      ui.Canvas canvas, double yOffset) {
    ui.Paragraph paragraph =
        _buildParagraphForLeftLabel(maxLineValue, line, lineStep);
    canvas.drawParagraph(
      paragraph,
      Offset(0.0, yOffset),
    );
  }

  /// Calculates offset difference between horizontal lines.
  ///
  /// e.g. between every line should be 100px space.
  double get _calculateHorizontalOffsetStep {
    return drawingHeight / (NUMBER_OF_HORIZONTAL_LINES - 1);
  }

  /// Calculates weight difference between horizontal lines.
  ///
  /// e.g. every line should increment weight by 5
  int _calculateHorizontalLineStep(int maxLineValue, int minLineValue) {
    return (maxLineValue - minLineValue) ~/ (NUMBER_OF_HORIZONTAL_LINES - 1);
  }

  void _drawBottomLabels(Canvas canvas, Size size) {
    for (int daysFromStart = numberOfDays;
        daysFromStart > 0;
        daysFromStart = (daysFromStart - (numberOfDays / 4)).round()) {
      double offsetXbyDay = drawingWidth / numberOfDays;
      double offsetX = leftOffsetStart + offsetXbyDay * daysFromStart;
      ui.Paragraph paragraph = _buildParagraphForBottomLabel(daysFromStart);
      canvas.drawParagraph(
        paragraph,
        Offset(offsetX - 50.0, 10.0 + drawingHeight),
      );
    }
  }

  ///Builds paragraph for label placed on the bottom (dates)
  ui.Paragraph _buildParagraphForBottomLabel(int daysFromStart) {
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      fontSize: 10.0,
      textAlign: TextAlign.right,
      fontFamily: 'Roboto',
    ))
      ..pushStyle(ui.TextStyle(color: Colors.black))
      ..addText(DateFormat('d MMM').format(DateTime.now()
          .current
          .subtract(Duration(days: numberOfDays - daysFromStart))));
    final ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: 50.0));
    return paragraph;
  }

  ///Builds text paragraph for label placed on the left side of a chart (weights)
  ui.Paragraph _buildParagraphForLeftLabel(
      int maxLineValue, int line, int lineStep) {
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontSize: 10.0,
        textAlign: TextAlign.right,
        fontFamily: 'Roboto',
      ),
    )
      ..pushStyle(ui.TextStyle(color: Colors.black))
      ..addText((maxLineValue - line * lineStep).toString());
    final ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: leftOffsetStart - 4));
    return paragraph;
  }

  ///Produces minimal and maximal value of horizontal line that will be displayed
  MinMax _getMinAndMaxValues(List<WeightEntry> entries, bool isLbs) {
    double maxWeight = entries.map((entry) => entry.weight).reduce(math.max);
    double minWeight = entries.map((entry) => entry.weight).reduce(math.min);

    if (isLbs) {
      maxWeight *= KG_LBS_RATIO;
      minWeight *= KG_LBS_RATIO;
    }
    int maxLineValue;
    int minLineValue;

    if (maxWeight == minWeight) {
      maxLineValue = maxWeight.ceil() + 1;
      minLineValue = maxLineValue - 4;
    } else {
      maxLineValue = maxWeight.ceil();
      int difference = maxLineValue - minWeight.floor();
      int toSubtract = (NUMBER_OF_HORIZONTAL_LINES - 1) -
          (difference % (NUMBER_OF_HORIZONTAL_LINES - 1));
      if (toSubtract == NUMBER_OF_HORIZONTAL_LINES - 1) {
        toSubtract = 0;
      }
      minLineValue = minWeight.floor() - toSubtract;
    }
    return MinMax(minLineValue, maxLineValue);
  }

  /// Calculates offset at which given entry should be painted
  Offset _getEntryOffset(WeightEntry entry, DateTime beginningOfChart,
      int minLineValue, int maxLineValue, bool isLbs) {
    double entryWeightToShow =
        isLbs ? entry.weight * KG_LBS_RATIO : entry.weight;
    int daysFromBeginning = entry.dateTime.difference(beginningOfChart).inDays;
    double relativeXposition = daysFromBeginning / (numberOfDays - 1);
    double xOffset = leftOffsetStart + relativeXposition * drawingWidth;
    double relativeYposition =
        (entryWeightToShow - minLineValue) / (maxLineValue - minLineValue);
    double yOffset = 5 + drawingHeight - relativeYposition * drawingHeight;
    return Offset(xOffset, yOffset);
  }

  _drawParagraphInsteadOfChart(ui.Canvas canvas, ui.Size size, String text) {
    double fontSize = 14.0;
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        fontSize: fontSize,
        textAlign: TextAlign.center,
        fontFamily: 'Roboto',
      ),
    )
      ..pushStyle(ui.TextStyle(color: Colors.black))
      ..addText(text);
    final ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: size.width));

    canvas.drawParagraph(paragraph, Offset(0.0, size.height / 2 - fontSize));
  }
}

class MinMax {
  final int min;
  final int max;

  MinMax(this.min, this.max);
}
