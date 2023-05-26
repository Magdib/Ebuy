import 'package:flutter/material.dart';

import '../constant/Colors.dart';

class AppTheme {
  static const String englishFontFamily = 'sanfrancisco';
  static const String arabicFontFamily = 'Amiri';
  static ThemeData englishTheme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryColor, secondary: AppColors.primaryColor),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: AppColors.black)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontFamily: englishFontFamily,
            height: 2),
        headline2: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontFamily: englishFontFamily),
        headline3: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: englishFontFamily),
        headline4: TextStyle(
          color: AppColors.lightGrey,
          fontFamily: englishFontFamily,
        ),
        headline5: TextStyle(
            color: AppColors.deepGrey,
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontFamily: englishFontFamily),
        headline6: TextStyle(
            color: AppColors.grey, fontSize: 16, fontFamily: englishFontFamily),
        bodyText1: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontFamily: englishFontFamily),
        bodyText2: TextStyle(
            color: AppColors.grey, fontSize: 12, fontFamily: englishFontFamily),
      ));
  static ThemeData arabicTheme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryColor, secondary: AppColors.primaryColor),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: AppColors.black)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontFamily: arabicFontFamily,
            height: 2),
        headline2: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontFamily: arabicFontFamily),
        headline3: TextStyle(
            color: AppColors.white, fontSize: 16, fontFamily: arabicFontFamily),
        headline4: TextStyle(
          color: AppColors.lightGrey,
          fontFamily: arabicFontFamily,
        ),
        headline5: TextStyle(
            color: AppColors.deepGrey,
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontFamily: arabicFontFamily),
        headline6: TextStyle(
            color: AppColors.grey, fontSize: 16, fontFamily: arabicFontFamily),
        bodyText1: TextStyle(
            color: AppColors.black, fontSize: 16, fontFamily: arabicFontFamily),
        bodyText2: TextStyle(
            color: AppColors.grey, fontSize: 12, fontFamily: arabicFontFamily),
      ));
}
