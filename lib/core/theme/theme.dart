import 'package:flutter/material.dart';

import '../constant/Colors.dart';

class AppTheme {
  static const String fontFamily = 'sanfrancisco';
  // static const String fontFamily = 'Amiri';
  static ThemeData arabicTheme = ThemeData.light().copyWith(
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: AppColors.black)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontFamily: fontFamily,
            height: 2),
        headline2: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontFamily: fontFamily),
        headline3: TextStyle(
            color: AppColors.white, fontSize: 16, fontFamily: fontFamily),
        headline4: TextStyle(
          color: AppColors.lightGrey,
          fontFamily: fontFamily,
        ),
        headline5: TextStyle(
            color: AppColors.deepGrey,
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontFamily: fontFamily),
        headline6: TextStyle(
            color: AppColors.grey, fontSize: 16, fontFamily: fontFamily),
        bodyText1: TextStyle(
            color: AppColors.black, fontSize: 16, fontFamily: fontFamily),
        bodyText2: TextStyle(
            color: AppColors.grey, fontSize: 12, fontFamily: fontFamily),
      ));
}
