import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/AccountSettings/GiftCardHelpCard.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GiftCardsCard.dart';
import 'NoGiftCardPage.dart';

class HandleGiftCards extends StatelessWidget {
  const HandleGiftCards({super.key, required this.anyCards});
  final bool anyCards;
  @override
  Widget build(BuildContext context) {
    return anyCards == true
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
                    onTap: () {},
                    text: 'Gift cards',
                  ),
                  GiftCardsCard(
                      text: 'Gift voucher',
                      icon: FontAwesomeIcons.gift,
                      onTap: () {})
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const GiftCardHelpCard()
            ],
          )
        : const NoGiftCardPage();
  }
}
