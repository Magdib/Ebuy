import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/shared/PageHeadersWithCartIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/Home/Favourite/FavouriteTapBar.dart';
import '../../Widgets/Home/Favourite/SaveditemsListView.dart';
import '../../Widgets/Home/Favourite/TapScrollContainer.dart';

class FavouritePage extends GetView<MainContrllerImp> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteControllerImp favouriteControllerImp =
        Get.put(FavouriteControllerImp());
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          PageHeadersWithCartIcon(
            title: 'Saved Items',
            backFunction: () => controller.changePage(0),
            cartFunction: () => controller.changePage(2),
          ),
          const SizedBox(
            height: 10,
          ),
          const FavouriteTapBar(),
          const SizedBox(
            height: 5,
          ),
          const TapScrollContainer(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: UINumber.deviceHeight / 1.5,
            child: PageView(
                controller: favouriteControllerImp.pageController,
                onPageChanged: (page) =>
                    favouriteControllerImp.changePage(page),
                children: [const SaveditemsListView(), Column()]),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
