import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/GiftCardDialogs.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/CustomButton.dart';
import 'DiliverCountryButton.dart';
import 'CheckOutItems.dart';

class Information extends StatelessWidget {
  const Information({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              const SizedBox(
                height: 20,
              ),
              const DiliverCountry(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const CheckOutItems(),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CheckOutControllerimp>(
                builder: (controller) => controller.giftLoading == false
                    ? CustomContainer(
                        child: MaterialButton(
                            height: 55,
                            minWidth: double.infinity,
                            color: controller.canAddGift == true
                                ? AppColors.white
                                : AppColors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: controller.canAddGift == true
                                ? () => giftCardMethodDialog(context)
                                : () => controller.reGetGift(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.canAddGift == true
                                      ? ' choose e-gift cards/ Voucher code'
                                      : "${controller.discount} ${controller.sign} Discount",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                controller.canAddGift == true
                                    ? const Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.grey,
                                      )
                                    : const Icon(
                                        Icons.restart_alt,
                                        color: AppColors.orange,
                                      )
                              ],
                            )),
                      )
                    : CustomContainer(
                        height: 55,
                        width: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: UINumber.deviceWidth / 2.5),
                            child: const CircularProgressIndicator()),
                      ),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GetBuilder<CheckOutControllerimp>(
          builder: (controller) => CustomButton(
              text: 'Shipping', onPressed: () => controller.nextStep()),
        ),
      ),
    ]);
  }
}
