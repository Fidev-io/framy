import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';

@FramyTheme()
class AppTheme {
  static ThemeData get getTheme => ThemeData(primarySwatch: Colors.orange);

  Color get getterBlack => Colors.black;

  Color methodBlack() => Colors.black;

  static const staticConstWhite = Colors.white;
  static final staticFinalWhite = Colors.white;
  static var staticVarWhite = Colors.white;
  final finalWhite = Colors.white;
  Color colorWhite = Colors.white;
}
