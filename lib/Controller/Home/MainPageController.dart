import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
import 'package:ebuy/core/function/handleHiveNullState.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/view/screens/Home/Cart/Cart.dart';
import 'package:ebuy/view/screens/Home/favourite/Favourite.dart';
import 'package:ebuy/view/screens/Home/HomePage/HomePage.dart';
import 'package:ebuy/view/screens/Home/search/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/dataSource/Static/UINumbers.dart';
import '../../view/screens/Home/Settings/SettingsMainPage.dart';
import 'package:hive/hive.dart';

abstract class MainController extends GetxController {
  changePage(int page);
  changeOpacity();
  EdgeInsets bottomBarHandle();
  void languageChanged();
}

class MainContrllerImp extends MainController {
  int bottomBarIndex = 0;
  bool? isEnglish;
  bool somthingChange = false;
  double opacity = 0.0;
  static double scrollOffset = 0;
  List<Widget> bottomBarPages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    FavouritePage(),
    SettingsMainPage(),
  ];
  List<int> visitedPages = [0];
  @override
  EdgeInsets bottomBarHandle() {
    if (isEnglish == false) {
      return bottomBarIndex == 0
          ? EdgeInsets.only(right: (UINumber.deviceWidth / 15))
          : bottomBarIndex == 1
              ? EdgeInsets.only(right: (UINumber.deviceWidth / 4))
              : bottomBarIndex == 2
                  ? EdgeInsets.only(right: (UINumber.deviceWidth / 2.3))
                  : bottomBarIndex == 3
                      ? EdgeInsets.only(right: (UINumber.deviceWidth / 1.61))
                      : EdgeInsets.only(right: (UINumber.deviceWidth / 1.25));
    } else {
      return bottomBarIndex == 0
          ? EdgeInsets.only(left: (UINumber.deviceWidth / 15))
          : bottomBarIndex == 1
              ? EdgeInsets.only(left: (UINumber.deviceWidth / 4))
              : bottomBarIndex == 2
                  ? EdgeInsets.only(left: (UINumber.deviceWidth / 2.3))
                  : bottomBarIndex == 3
                      ? EdgeInsets.only(left: (UINumber.deviceWidth / 1.61))
                      : EdgeInsets.only(left: (UINumber.deviceWidth / 1.25));
    }
  }

  @override
  changeOpacity() {
    opacity = 1;
    update();
  }

  @override
  changePage(int page) {
    HomePageControllerImp homeController = Get.find();
    if (visitedPages.contains(page) == false) {
      visitedPages.add(page);
    } else {
      if (bottomBarIndex != page) {
        switch (page) {
          case 0:
            homeController.canReGetData = false;
            homeController.refreshPage();
            break;
          case 1:
            SearchControllerImp searchController = Get.find();
            searchController.getSearchData();
            break;
          case 2:
            CartControllerImp cartController = Get.find();
            cartController.refreshData();
            break;
          case 3:
            FavouriteControllerImp favouriteController = Get.find();
            favouriteController.refreshData();
            break;

          default:
        }
      }
    }
    bottomBarIndex = page;

    update();
  }

  @override
  void languageChanged() {
    isEnglish = !isEnglish!;
    bottomBarHandle();
  }

  @override
  void onReady() async {
    changeOpacity();
    Box authBox = await Hive.openBox(HiveBoxes.authBox);
    Get.put(HomePageControllerImp());
    await Future.delayed(const Duration(seconds: 2));
    bool langNullval;
    if (authBox.get(HiveKeys.language) == null) {
      if (Get.deviceLocale!.languageCode.contains('ar') == true) {
        langNullval = false;
      } else {
        langNullval = true;
      }
    } else {
      langNullval = false;
    }
    isEnglish = handleHiveNullState(HiveKeys.language, langNullval);
    update();
    super.onReady();
  }
}
