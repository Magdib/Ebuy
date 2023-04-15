import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/view/screens/Home/Cart.dart';
import 'package:ebuy/view/screens/Home/Favourite.dart';
import 'package:ebuy/view/screens/Home/HomePage/HomePage.dart';
import 'package:ebuy/view/screens/Home/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../view/screens/Home/Settings/SettingsMainPage.dart';
import 'package:hive/hive.dart';

abstract class MainController extends GetxController {
  changePage(int page);
}

class MainContrllerImp extends MainController {
  int bottomNavigationBarCurrentIndex = 0;
  static double scrollOffset = 0;
  List<Widget> bottomNavigationBarPages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    FavouritePage(),
    SettingsMainPage(),
  ];

  @override
  changePage(int page) {
    bottomNavigationBarCurrentIndex = page;
    update();
  }

  @override
  void onReady() async {
    await Hive.openBox(HiveBoxes.authBox);
    super.onReady();
  }
}
