import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/view/Widgets/shared/CustomRadio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

addressDialog(BuildContext context) {
  CheckOutControllerimp controller = Get.find();
  return Get.defaultDialog(
      title: "Choose Address",
      titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
      onWillPop: () => controller.changeAddress(-1),
      content: GetBuilder<CheckOutControllerimp>(
        builder: (controller) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
                  children: [
                    CustomRadio(
                      condition: controller.currentStep == 1
                          ? (controller.shippingAddress == index ? true : false)
                          : controller.paymentAddress == index
                              ? true
                              : false,
                      radius: 30,
                      onTap: () => controller.changeAddress(index),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      controller.addressList[index].addressName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: controller.addressList.length < 5
                ? controller.addressList.length
                : 5),
      ));
}
