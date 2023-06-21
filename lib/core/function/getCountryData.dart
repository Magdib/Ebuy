import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/dataSource/Static/HiveKeys.dart';

String getCountryData(String countryName, String countryCode, String type) {
  Box authBox = Hive.box(HiveBoxes.authBox);
  if (countryName.contains("سوريا") ||
      countryName.isCaseInsensitiveContains("syria")) {
    if (authBox.get(HiveKeys.language) == false) {
      countryName = "Syria";
    } else {
      countryName = "سوريا";
    }
    countryCode = "Sy";
  } else if (countryName.contains("الولايات المتحدة") ||
      countryName.isCaseInsensitiveContains("United States")) {
    if (authBox.get(HiveKeys.language) == false) {
      countryName = "United States";
    } else {
      countryName = "الولابات المتحدة";
    }
    countryCode = "Us";
  }
  if (type == "Name") {
    return countryName;
  } else {
    return countryCode;
  }
}
