import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/GiftCardDialogs.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/CustomButton.dart';
import 'DiliverCountryButton.dart';
import 'CheckOutItem.dart';

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
              const DiliverCountryButton(),
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
              const CheckOutItem(),
              const SizedBox(
                height: 20,
              ),
              CustomContainer(
                  child: MaterialButton(
                      height: 55,
                      minWidth: double.infinity,
                      color: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () => giftCardMethodDialog(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' choose e-gift cards/ Voucher code',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.grey,
                          )
                        ],
                      )))
            ]),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: GetBuilder<CartControllerImp>(
          builder: (controller) => CustomButton(
              text: 'Shipping', onPressed: () => controller.nextStep()),
        ),
      )
    ]);
  }
}
