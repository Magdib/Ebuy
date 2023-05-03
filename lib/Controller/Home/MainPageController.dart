import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
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
  int bottomBarIndex = 0;

  bool somthingChange = false;
  static double scrollOffset = 0;
  List<Widget> bottomBarPages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    FavouritePage(),
    SettingsMainPage(),
  ];

  @override
  changePage(int page) {
    if (page == 0 && somthingChange == true) {
      HomePageControllerImp homeController = Get.find();
      homeController.refreshPage();
      somthingChange = false;
    }
    bottomBarIndex = page;
    update();
  }
}
