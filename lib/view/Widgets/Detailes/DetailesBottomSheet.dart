import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

import '../../../data/dataSource/Static/UINumbers.dart';
import '../shared/ProductNumbers.dart';
import 'DetailesBottomCard.dart';
import 'DetailesColorsListView.dart';
import 'DetailesSizesListView.dart';

class DetailesBottomSheet extends StatelessWidget {
  const DetailesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailesControllerImp>(
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.onWillPopSnackBar(),
        child: HandlingDataRequest(
          onPressed: () => controller.addToCart(),
          statusRequest: controller.cartstatusRequest,
          widget: Container(
            height: UINumber.deviceHeight / 1.4,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.grey,
                        size: 30,
                      )),
                ),
                const DetailesBottomCard(),
                Text(
                  'Color:'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const DetailesColorsListView(),
                Text(
                  'Size:'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const DetailesSizesListView(),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount:'.tr,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ProductNumbers(
                          value: controller.itemsAmount,
                          increaseFuncion: () => controller.increaseAmount(),
                          decreaseFuncion: () => controller.decreaseAmount()),
                    ],
                  ),
                ),
                CustomConditionButton(
                  condition: controller.canAddToCart,
                  text: 'Add to cart'.tr,
                  onPressed: () => controller.addToCart(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
