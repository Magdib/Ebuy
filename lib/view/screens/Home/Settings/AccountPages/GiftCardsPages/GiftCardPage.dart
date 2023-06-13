import 'package:ebuy/Controller/Home/SettingsControllers/GiftCardController.dart';

import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/GiftCardExample.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftCardPage extends GetView<GiftCardControllerimp> {
  const GiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Gift Cards", context, 4),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: controller.giftCards.length,
                    itemBuilder: (context, index) => GiftCardExample(
                          shortDigit:
                              controller.giftCards[index].cardShortDigit,
                          longDigit: controller.giftCards[index].cardLongDigit,
                        )),
              ),
              CustomButton(
                  text: "Add gift card",
                  onPressed: () => Get.toNamed(AppRoutes.addGiftCardPageRoute))
            ],
          ),
        ));
  }
}
