import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff820000);

  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff820000),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(const Color(0xff820000)),
        overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff820000),
          ),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff820000)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: Colors.blue,
      // ...
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      // ...
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Color(0xff820000),
      contentTextStyle: TextStyle(
        color: Color(0xff820000),
      ),
      // ...
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      // ...
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: Color(0xff9C0000),
      hoverColor: Color(0xff9C0000),
      // Define TextField styles here
      labelStyle: TextStyle(
        color: Color(0xff9C0000),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color(0xff9C0000),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff9C0000),
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff9C0000),
        ),
      ),
      // ...
    ),
    // Add more component themes here, such as date picker theme
  );
}
