import 'package:flutter/material.dart';
import 'package:notes_app/services/services_index.dart';

class AppThemeData {
  BottomNavigationBarThemeData createBottomNavigationBarTheme() {
    return const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.yellow,
      selectedIconTheme: IconThemeData(color: AppColors.green),
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: TextStyle(fontSize: 0),
      unselectedIconTheme: IconThemeData(color: AppColors.pink),
      selectedLabelStyle: TextStyle(fontSize: 0),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  TextTheme createTextTheme() {
    return TextTheme(
      titleLarge: TextStyle(
          fontSize: 35,
          color: AppColors.redBrown,
          fontFamily: AppFonts.chloe.font,
          height: 0),
      titleMedium: TextStyle(
          fontSize: 45,
          color: AppColors.white,
          fontFamily: AppFonts.chloe.font,
          height: 0),
      titleSmall: TextStyle(
          fontSize: 20,
          color: AppColors.redBrown,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.versailles.font,
          height: 0),
      bodyLarge: TextStyle(
          fontSize: 35,
          color: AppColors.redBrown,
          fontFamily: AppFonts.chloe.font,
          height: 0),
      bodyMedium: TextStyle(
          fontSize: 15,
          color: AppColors.darkRedBrown,
          fontFamily: AppFonts.versailles.font,
          height: 0),
      bodySmall: TextStyle(
          fontSize: 10,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontFamily: AppFonts.versailles.font,
          height: 0),
      labelLarge: TextStyle(
        fontSize: 12,
        color: AppColors.redBrown,
        fontWeight: FontWeight.w900,
        fontFamily: AppFonts.versailles.font,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: AppColors.white,
        fontWeight: FontWeight.w900,
        fontFamily: AppFonts.versailles.font,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        color: AppColors.darkRedBrown,
        fontWeight: FontWeight.w900,
        fontFamily: AppFonts.versailles.font,
      ),
    );
  }
}
