import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(primary: Colors.blue, secondary: Colors.green),
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black), bodyMedium: TextStyle(color: Colors.black87)),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: CustomColors.backgroundColor,
    colorScheme: ColorScheme.dark(
      primary: CustomColors.greenColor,
      secondary: CustomColors.yellowColor,
      tertiary: CustomColors.redColor,
      error: CustomColors.valenciaColor,
      onPrimary: CustomColors.whiteColor,
      onSecondary: CustomColors.doveGrayColor,
    ),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(bodyLarge: TextStyle(color: CustomColors.whiteColor), bodyMedium: TextStyle(color: CustomColors.whiteColor)),
  );
}
