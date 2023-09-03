import 'package:flutter/material.dart';

const Color _primaryValue = Color(0xFF6200EE);

const _customColorsTheme = [
  _primaryValue,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < _customColorsTheme.length);

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _customColorsTheme[selectedColor],
    );
  }


}