import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColorLight: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: AppColors.blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static final ThemeData darkMode = ThemeData(
    primaryColorLight: AppColors.primaryDarktColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: AppColors.yellowColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
