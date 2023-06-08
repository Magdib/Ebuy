import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/OrdersWidgets/OrdersCard.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandleOrders extends GetView<OrdersControllerimp> {
  const HandleOrders({super.key, required this.anyOrders});
  final bool anyOrders;
  @override
  Widget build(BuildContext context) {
    return anyOrders == false
        ? CustomPage(
            svgImage: AppImagesAssets.noOrdersImage,
            title: 'You currently have no orders'.tr,
            subtitle:
                'You can Start Shopping by adding some products to your cart and checkout... '
                    .tr,
            buttonText: 'Start shopping'.tr,
            isSpaced: true,
            onPressed: () => Get.offAllNamed(AppRoutes.mainPageRoute))
        : TabBarView(controller: controller.tabController, children: [
            ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemBuilder: (context, index) => OrdersCard(
                    onTap: () => Get.toNamed(AppRoutes.orderTrackPageRoute)),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 3),
            ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemBuilder: (context, index) => OrdersCard(
                      onTap: () => Get.toNamed(AppRoutes.orderTrackPageRoute),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 3)
          ]);
  }
}
