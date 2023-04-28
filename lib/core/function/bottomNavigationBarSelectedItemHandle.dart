import 'package:flutter/material.dart';

import '../../Controller/Home/MainPageController.dart';
import '../../data/dataSource/Static/UINumbers.dart';

EdgeInsets bottomNavigationBarSelectedItemHandle(
    MainContrllerImp mainContrllerImp) {
  return mainContrllerImp.bottomBarIndex == 0
      ? EdgeInsets.only(left: (UINumber.deviceWidth / 15))
      : mainContrllerImp.bottomBarIndex == 1
          ? EdgeInsets.only(left: (UINumber.deviceWidth / 4))
          : mainContrllerImp.bottomBarIndex == 2
              ? EdgeInsets.only(left: (UINumber.deviceWidth / 2.3))
              : mainContrllerImp.bottomBarIndex == 3
                  ? EdgeInsets.only(left: (UINumber.deviceWidth / 1.61))
                  : EdgeInsets.only(left: (UINumber.deviceWidth / 1.25));
}
