import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/shared/CustomPage.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: CustomPage(
            svgImage: AppImagesAssets.paymentImage,
            title: 'Your order placed'.tr,
            subtitle:
                'Your order has been placed successfully. You can visit my order to check the delivery process.'
                    .tr,
            buttonText: 'Continue shopping'.tr,
            onPressed: () => Get.offAllNamed(AppRoutes.mainPageRoute)),
      ),
    );
  }
}
