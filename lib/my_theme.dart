import 'package:flutter/material.dart';

class My_Theme {
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffffffff);
  static Color primaryLightColor = Color(0xffB7935F);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: blackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: blackColor,
        ),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: blackColor));
}
