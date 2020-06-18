import 'package:flutter/material.dart';
import 'package:framy_annotation/framy_annotation.dart';

@framyTheme
class AppTheme {
  static final themeData = ThemeData(
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static const defaultAvatarColor = Color(0xFFB0DFB0);
}
