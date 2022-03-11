import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: ThemeData.dark().textTheme,
        fontFamily: 'RobotoSlab', //3
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ));
  }
}
