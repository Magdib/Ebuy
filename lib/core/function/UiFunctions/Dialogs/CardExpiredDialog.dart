import 'package:ebuy/Controller/Home/SettingsControllers/PaymentController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/Settings/PaymentWidgets/CardExpiryWheelList.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/Colors.dart';

cardExpiredDialog(BuildContext context) {
  PaymentControllerimp controller = Get.find();
  Get.defaultDialog(
      title: '',
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GetBuilder<PaymentControllerimp>(
            builder: (controller) => CardExpiryWheelList(
              childCount: 12,
              onSelectedItemChanged: (value) =>
                  controller.changeExpiryMonth(value),
              startFrom: 1,
              variable: controller.selectedMonth,
            ),
          ),
          GetBuilder<PaymentControllerimp>(
            builder: (controller) => CardExpiryWheelList(
              childCount: 20,
              onSelectedItemChanged: (value) =>
                  controller.changeExpiryYear(value),
              startFrom: DateTime.now().year,
              variable: controller.selectedYear,
            ),
          ),
        ]),
      ),
      onWillPop: () => controller.resetExpiryTime(),
      confirm: CustomButton(
        text: 'Done',
        onPressed: () => controller.saveExpiryTime(),
        width: UINumber.deviceWidth / 3,
      ),
      cancel: CustomButton(
        text: 'Cancel',
        onPressed: () => controller.resetExpiryTime(),
        color: AppColors.white,
        textColor: AppColors.primaryColor,
        width: UINumber.deviceWidth / 3,
      ));
}
