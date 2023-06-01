import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/DialogButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmPaymentDialog(BuildContext context) => Get.defaultDialog(
    title: "Confirm payment",
    titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
    middleText: "Are you sure you want to pay and place order?",
    middleTextStyle: Theme.of(context).textTheme.headline6,
    confirm: DialogButton(
      title: 'Confirm',
      onPressed: () => Get.toNamed(AppRoutes.orderSuccessRoute),
    ),
    cancel: DialogButton(title: 'Cancle', onPressed: () => Get.back()));
