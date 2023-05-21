import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/NewTrend/FilterPageWidgets/GreyDivider.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/CustomRadio.dart';
import '../UserAddressShipBox.dart';
import 'ShipOptionsBox.dart';

class Shipping extends GetView<CartControllerImp> {
  const Shipping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        Text(
          'Shipping address',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        UserAddressShipBox(
            title: 'Postal address', userAddress: controller.addressList),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Shipping options',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        const ShipOptionsBox(),
        const SizedBox(
          height: 20,
        ),
        CustomButton(text: 'Payment', onPressed: () => controller.nextStep())
      ],
    );
  }
}
