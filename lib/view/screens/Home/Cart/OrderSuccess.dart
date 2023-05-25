import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/shared/CustomPage.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPage(
          svgImage: AppImagesAssets.paymentImage,
          title: 'Your order placed',
          subtitle:
              'Your order has been placed successfully. You can visit my order to check the delivery process.',
          buttonText: 'Continue shopping',
          onPressed: () => Get.offAllNamed(AppRoutes.mainPageRoute)),
    );
  }
}
