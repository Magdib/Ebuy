import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/CustomButton.dart';
import '../../../shared/CustomContainer.dart';
import 'GiftCardHelpCard.dart';

class NoGiftCardPage extends StatelessWidget {
  const NoGiftCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          AppImagesAssets.giftCard,
          height: 120,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomContainer(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You have no card yet',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'You currently have no cards linked to your account.\nGet started by see redeeming or buying\none now.',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    text: 'Add gift cards ',
                    onPressed: () =>
                        Get.toNamed(AppRoutes.addGiftCardPageRoute)),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    text: 'Buy gift voucher',
                    color: AppColors.white,
                    textColor: AppColors.primaryColor,
                    onPressed: () => print(AppWords.websiteWord)),
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        const GiftCardHelpCard(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
