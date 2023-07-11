import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftCardExample extends StatelessWidget {
  const GiftCardExample({
    super.key,
    this.shortDigit,
    this.longDigit,
    this.giftCardValue,
  });
  final String? shortDigit;
  final String? longDigit;
  final String? giftCardValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                giftCardValue == null
                    ? 'Back of Gift Card'.tr
                    : "\$ $giftCardValue",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                shortDigit == null
                    ? '123456789456789   6789'
                    : '$longDigit   $shortDigit',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                AppImagesAssets.giftCardEx,
                width: UINumber.deviceWidth / 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: UINumber.deviceWidth / 1.3,
                height: 20,
                color: AppColors.veryLightGrey,
              ),
            ],
          )),
    );
  }
}
