import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address book',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomPage(
          svgImage: AppImagesAssets.noAddressImage,
          title: 'You need a billing address',
          subtitle:
              'You currently have no saved address.Without one, you won\'t able to add a new payment method.',
          buttonText: 'Add new address',
          isSpaced: true,
          onPressed: () => Get.offNamed(AppRoutes.addressPageRoute)),
    );
  }
}
