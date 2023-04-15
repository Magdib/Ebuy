import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/favouritePageController.dart';

import '../../../../core/theme/theme.dart';

class FavouriteTapBar extends GetView<FavouriteControllerImp> {
  const FavouriteTapBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: () => controller.changePage(0),
            child: Text(
              'All Iteams',
              style: controller.currentPage == 0
                  ? AppTheme.arabicTheme.textTheme.headline2!
                      .copyWith(fontSize: 16)
                  : AppTheme.arabicTheme.textTheme.bodyText1!
                      .copyWith(fontSize: 16),
            ),
          ),
          MaterialButton(
            onPressed: () => controller.changePage(1),
            child: Text(
              'Boards',
              style: controller.currentPage == 1
                  ? AppTheme.arabicTheme.textTheme.headline2!
                      .copyWith(fontSize: 16)
                  : AppTheme.arabicTheme.textTheme.headline4!
                      .copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
