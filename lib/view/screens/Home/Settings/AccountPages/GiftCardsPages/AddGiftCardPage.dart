import 'package:ebuy/Controller/Home/SettingsControllers/GiftCardController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/GiftCardExample.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGiftCardPage extends GetView<GiftCardControllerimp> {
  const AddGiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add gift card '.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: GetBuilder<GiftCardControllerimp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: () => controller.addGiftCard(),
          statusRequest: controller.checkStatusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        Text(
                          'Enter the long number and scratch off the panel on your card to reveal your pin as shown below.'
                              .tr,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const GiftCardExample(),
                        const SizedBox(
                          height: 15,
                        ),
                        TitledTextField(
                            label: '16-Digit Code'.tr,
                            hint: 'Enter 16-Digit Code'.tr,
                            obscure: false,
                            keyboardType: TextInputType.number,
                            textEditingController:
                                controller.longDigitController,
                            validator: (val) =>
                                controller.validateLongDigit(val!)),
                        TitledTextField(
                            label: '4-Digit Pin'.tr,
                            hint: 'Enter 4-Digit Code'.tr,
                            obscure: false,
                            keyboardType: TextInputType.number,
                            textEditingController:
                                controller.shortDigitController,
                            validator: (val) =>
                                controller.validateShortDigit(val!))
                      ],
                    ),
                  ),
                ),
                CustomButton(
                    text: 'Add gift card '.tr,
                    onPressed: () => controller.addGiftCard())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
