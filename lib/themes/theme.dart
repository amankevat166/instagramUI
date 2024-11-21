import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      canvasColor: creamColor,
      primaryColor: Colors.white,
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.grey,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 14,
              color: Color(0XFFFFFFFF),
              fontWeight: FontWeight.normal),
          displayMedium: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.normal)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedItemColor: Vx.gray600,
        showSelectedLabels: false,
        backgroundColor: Colors.white,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      canvasColor: darkCreamColor,
      brightness: Brightness.dark,
      primaryColor: darkCreamColor,
      primaryColorDark: Colors.white,
      primaryColorLight: Colors.white60,

      appBarTheme:  AppBarTheme(

        color: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 14,
              color: Color(0XFFFFFFFF),
              fontWeight: FontWeight.normal),
          displayMedium: TextStyle(
              fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white70,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
}
