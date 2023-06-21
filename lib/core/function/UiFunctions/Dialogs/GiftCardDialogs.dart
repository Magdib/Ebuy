import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:ebuy/view/Widgets/shared/TitledTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

giftCardMethodDialog(BuildContext context) {
  return Get.defaultDialog(
      title: 'Choose Method:',
      titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      content: GetBuilder<CheckOutControllerimp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: () => controller.getVoucher(),
          statusRequest: controller.giftStatus,
          widget: Column(
            children: [
              TitledTextField(
                  label: 'Gift voucher',
                  hint: 'Enter gift voucher code here...',
                  onChanged: (val) => controller.handleVoucher(),
                  textEditingController: controller.voucherController),
              CustomConditionButton(
                text: 'Add gift Voucher',
                onPressed: () => controller.getVoucher(),
                borderRadius: 40,
                condition: controller.canAddVoucher,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Choose gift card',
                onPressed: () => Get.toNamed(AppRoutes.giftCardsPageRoute,
                    arguments: {ArgumentsNames.canChooseCard: true}),
                borderRadius: 40,
              )
            ],
          ),
        ),
      ));
}
