import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/view/Widgets/shared/DialogButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmPaymentDialog(BuildContext context) {
  CheckOutControllerimp controller = Get.find();
  Get.defaultDialog(
      title: "Confirm payment".tr,
      titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
      middleText:
          "Are you sure you want to pay and place order? !!!!!(this app is for cv so there is no payment Process!!!!!)"
              .tr,
      middleTextStyle: Theme.of(context).textTheme.headline6,
      confirm: DialogButton(
        title: 'Confirm'.tr,
        onPressed: () {
          controller.placeOrder();
        },
      ),
      cancel: DialogButton(title: 'Cancle'.tr, onPressed: () => Get.back()));
}
