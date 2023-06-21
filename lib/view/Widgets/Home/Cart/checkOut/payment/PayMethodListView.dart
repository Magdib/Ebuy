import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NoPaymentCard.dart';

class PayMethodListView extends GetView<CheckOutControllerimp> {
  const PayMethodListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      radius: 5,
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ListView.separated(
          padding:
              const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              controller.paymentMethods.length > index
                  ? GetBuilder<CheckOutControllerimp>(
                      builder: (controller) => GestureDetector(
                        onTap: () => controller.choosePayMethod(index),
                        child: CustomContainer(
                            height: 85,
                            width: 85,
                            radius: 5,
                            borderColor: controller.selectedPayment == index
                                ? AppColors.primaryColor
                                : null,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Image.asset(
                              controller.paymentMethods[index],
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    )
                  : const NoPaymentCard(),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: 3),
    );
  }
}
