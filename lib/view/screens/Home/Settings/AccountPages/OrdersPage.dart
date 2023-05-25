import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My orders',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomPage(
          svgImage: AppImagesAssets.noOrdersImage,
          title: 'You currently have no orders',
          subtitle: 'Best get shopping App pronto... ',
          buttonText: 'Start shopping',
          isSpaced: true,
          onPressed: () => Get.offAllNamed(AppRoutes.mainPageRoute)),
    );
  }
}
