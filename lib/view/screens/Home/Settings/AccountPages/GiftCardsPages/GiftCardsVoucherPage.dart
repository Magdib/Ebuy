import 'package:ebuy/Controller/Home/SettingsControllers/GiftCardController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/AppWords.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/GiftCardHelpCard.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/GiftCardsCard.dart';
import 'package:ebuy/view/Widgets/Home/Settings/GiftCardWidgets/NoGiftCardPage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GiftCardsVoucherPage extends StatelessWidget {
  const GiftCardsVoucherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gift cards & voucher',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<GiftCardControllerimp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: () => controller.getGiftCards(),
          statusRequest: controller.statusRequest,
          widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: controller.anyGiftCard == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GiftCardsCard(
                              icon: Icons.card_giftcard,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.giftCardsPageRoute),
                              text: 'Gift cards',
                            ),
                            GiftCardsCard(
                                text: 'Gift voucher',
                                icon: FontAwesomeIcons.gift,
                                onTap: () => print(AppWords.websiteWord))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const GiftCardHelpCard()
                      ],
                    )
                  : const NoGiftCardPage()),
        ),
      ),
    );
  }
}
