import 'package:flutter/material.dart';

import 'colors.dart';

///this class contain ThemeData used in the App
class AppTheme {
  AppTheme._();
  static Color chooseColor(String? input) {
    switch (input) {
      case "Stage PFE":
        return AppColors.green;
      case "Offre Emploi":
        return AppColors.blue;
      case "Stage ouvrier":
        return AppColors.teal;
      case "Stage pratique":
        return AppColors.white;
      default:
        return AppColors.blue;
    }
  }

  static InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide.none,
  );

  static ThemeData defaultTheme = ThemeData(
    //appBarTheme: AppBarTheme(color: AppColors.black),
    primaryColor: AppColors.green,
    cardColor: AppColors.blackAccent,
    backgroundColor: AppColors.black,
    buttonColor: AppColors.teal,
    accentColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Mulish", cursorColor: AppColors.teal,

    ///[Text Theme]
    textTheme: TextTheme(
      button: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 24.0, color: AppColors.white),
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 34.0, color: AppColors.white),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30.0, color: AppColors.white),
      headline3: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 38.0, color: AppColors.white),
      headline4: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 26.0,
          color: AppColors.white),
      headline5: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 22.0,
          color: AppColors.white),
      headline6: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20.0,
          color: AppColors.white),
      bodyText1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18.0, color: AppColors.white),
      bodyText2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16.0, color: AppColors.white),
      // This is The TextStyle of TextField & TextFormField
      subtitle1: TextStyle(color: AppColors.white, fontSize: 18.0),
      subtitle2: TextStyle(color: AppColors.white, fontSize: 16.0),
      caption: TextStyle(color: AppColors.white, fontSize: 12.0),
    ),

    ///[Bottom Navigation Bar]
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.blackDeep,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(color: AppColors.teal, size: 22.0),
      unselectedIconTheme:
          IconThemeData(color: const Color(0xff52585E), size: 22.0),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        color: AppColors.teal,
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
      ),
      selectedItemColor: AppColors.teal,
      unselectedItemColor: AppColors.blackDeep,
    ),

    ///[Text Field]
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      border: _inputBorder,
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder,
      disabledBorder: _inputBorder,
    ),

    ///[Card Theme]
    cardTheme: CardTheme(
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      color: AppColors.blackAccent,
    ),

    ///[Button Theme]
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.teal,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
