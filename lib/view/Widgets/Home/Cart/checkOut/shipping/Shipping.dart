import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UserAddressShipBox.dart';
import 'ShipOptionsBox.dart';

class Shipping extends GetView<CheckOutControllerimp> {
  const Shipping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        Text(
          'Shipping address'.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<CheckOutControllerimp>(
          builder: (controller) => UserAddressShipBox(
              title: 'Postal address'.tr,
              userAddress: controller.shippingAddresList),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Shipping options'.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        const ShipOptionsBox(),
        const SizedBox(
          height: 20,
        ),
        CustomButton(text: 'Payment'.tr, onPressed: () => controller.nextStep())
      ],
    );
  }
}
