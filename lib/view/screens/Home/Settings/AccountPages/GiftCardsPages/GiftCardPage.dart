import 'package:ebuy/Controller/Home/SettingsControllers/GiftCardController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/GiftCardExample.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Gift cards".tr, context, 4),
        body: GetBuilder<GiftCardControllerimp>(
          builder: (controller) => HandlingDataRequest(
            onPressed: () => controller.getGiftCards(),
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Expanded(
                    child: GetBuilder<GiftCardControllerimp>(
                      builder: (controller) => ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                          itemCount: controller.giftCards.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () => controller.chooseGiftCard(index),
                                child: GiftCardExample(
                                  shortDigit: controller
                                      .giftCards[index].cardShortDigit,
                                  longDigit:
                                      controller.giftCards[index].cardLongDigit,
                                  giftCardValue:
                                      controller.giftCards[index].cardDiscount,
                                ),
                              )),
                    ),
                  ),
                  CustomButton(
                      text: "Add gift card ".tr,
                      onPressed: () =>
                          Get.toNamed(AppRoutes.addGiftCardPageRoute))
                ],
              ),
            ),
          ),
        ));
  }
}
