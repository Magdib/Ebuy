import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

giftCardMethodDialog(BuildContext context) {
  return Get.defaultDialog(
      title: 'Choose Method:',
      titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      content: Column(
        children: [
          CustomButton(
            text: 'Add gift card',
            onPressed: () {},
            borderRadius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Choose gift card',
            onPressed: () {},
            borderRadius: 40,
          )
        ],
      ));
}
