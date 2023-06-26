import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Settings/OrdersWidgets/OrdersCard.dart';
import 'package:ebuy/view/Widgets/shared/CustomPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersControllerimp>(
      builder: (controller) => Scaffold(
        appBar: controller.anyOrders == false
            ? customAppBar(
                'My orders'.tr,
                context,
                0,
              )
            : AppBar(
                title: Text(
                  'My orders'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 20),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                elevation: 0,
                actions: [
                  IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.cartRoute),
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.deepGrey,
                      ))
                ],
                bottom: TabBar(
                  controller: controller.tabController,
                  tabs: controller.tabsList,
                  indicatorColor: AppColors.primaryColor,
                  indicatorWeight: 4,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                  labelStyle: Theme.of(context).textTheme.headline2,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.grey,
                ),
              ),
        body: HandlingDataRequest(
            onPressed: () => controller.getOrders(),
            statusRequest: controller.statusRequest,
            widget: controller.anyOrders == false
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        itemBuilder: (context, index) => OrdersCard(
                            index: index,
                            ordersList: controller.uiOrdersList,
                            onTap: () => controller.goToDetailes(index)),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: controller.uiOrdersList.length),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        itemBuilder: (context, index) => OrdersCard(
                              index: index,
                              ordersList: controller.pastOrdersList,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.orderTrackPageRoute),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: controller.pastOrdersList.length)
                  ])),
      ),
    );
  }
}
