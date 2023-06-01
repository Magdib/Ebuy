import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HandleOrders.dart';

class OrdersPage extends GetView<OrdersControllerimp> {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: true == false
            ? customAppBar(
                'My orders',
                context,
                0,
              )
            : AppBar(
                title: Text(
                  'My orders',
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
                      onPressed: () => Get.toNamed(AppRoutes.searchRoute),
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.deepGrey,
                      )),
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
        body: const HandleOrders(anyOrders: true));
  }
}
