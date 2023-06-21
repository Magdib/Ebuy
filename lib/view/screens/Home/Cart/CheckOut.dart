import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';

import 'package:ebuy/view/Widgets/Home/Cart/CustomStepper.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/Information/Information.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/payment/Payment.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/shipping/Shipping.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CheckOutControllerimp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: GetBuilder<CheckOutControllerimp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: () => controller.getAddresses(),
          statusRequest: controller.statusRequest,
          widget: controller.anyAddress == true
              ? Column(
                  children: [
                    const CustomStepper(),
                    Expanded(
                      child: PageView(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            Information(),
                            Shipping(),
                            Payment()
                          ]),
                    ),
                  ],
                )
              : CustomPage(
                  svgImage: AppImagesAssets.noAddressImage,
                  title: 'You need a billing address',
                  subtitle:
                      'You currently have no saved address.Without one, you won\'t able to add a new payment method.',
                  buttonText: 'Add new address',
                  isSpaced: true,
                  onPressed: () => Get.offNamed(AppRoutes.addressPageRoute)),
        ),
      ),
    );
  }
}
