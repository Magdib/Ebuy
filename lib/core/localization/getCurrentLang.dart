import 'package:ebuy/core/theme/theme.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

getLocal() {
  bool? isEnglish = Hive.box(HiveBoxes.authBox).get(HiveKeys.language);
  if (isEnglish == true) {
    return const Locale('en');
  } else if (isEnglish == false) {
    return const Locale('ar');
  }
  return Get.deviceLocale;
}

getcurrentTheme() {
  bool? isEnglish = Hive.box(HiveBoxes.authBox).get(HiveKeys.language);
  if (isEnglish != null) {
    if (isEnglish == true) {
      return AppTheme.englishTheme;
    } else if (isEnglish == false) {
      return AppTheme.arabicTheme;
    }
  } else {
    if (Get.deviceLocale!.languageCode.contains('ar')) {
      return AppTheme.arabicTheme;
    } else {
      return AppTheme.englishTheme;
    }
  }
}
