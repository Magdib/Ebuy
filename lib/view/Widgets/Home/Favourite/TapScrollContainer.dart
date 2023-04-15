import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/favouritePageController.dart';
import '../../../../core/constant/Colors.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class TapScrollContainer extends StatelessWidget {
  const TapScrollContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteControllerImp>(
      builder: (controller) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: (UINumber.deviceWidth / 2) - 20,
        height: 3,
        color: AppColors.primaryColor,
        margin: controller.currentPage == 0
            ? EdgeInsets.only(right: UINumber.deviceWidth / 2)
            : EdgeInsets.only(left: UINumber.deviceWidth / 2),
      ),
    );
  }
}
