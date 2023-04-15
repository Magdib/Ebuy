import 'package:flutter/material.dart';

import '../../Controller/Home/MainPageController.dart';
import '../../data/dataSource/Static/UINumbers.dart';

EdgeInsets bottomNavigationBarSelectedItemHandle(
    MainContrllerImp mainContrllerImp) {
  return mainContrllerImp.bottomNavigationBarCurrentIndex == 0
      ? EdgeInsets.only(left: (UINumber.deviceWidth / 15))
      : mainContrllerImp.bottomNavigationBarCurrentIndex == 1
          ? EdgeInsets.only(left: (UINumber.deviceWidth / 4))
          : mainContrllerImp.bottomNavigationBarCurrentIndex == 2
              ? EdgeInsets.only(left: (UINumber.deviceWidth / 2.3))
              : mainContrllerImp.bottomNavigationBarCurrentIndex == 3
                  ? EdgeInsets.only(left: (UINumber.deviceWidth / 1.61))
                  : EdgeInsets.only(left: (UINumber.deviceWidth / 1.25));
}
