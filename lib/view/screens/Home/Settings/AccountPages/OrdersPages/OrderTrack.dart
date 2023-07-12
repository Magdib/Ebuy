import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/CustomPackages/IconStepper.dart';
import 'package:ebuy/view/Widgets/Home/Settings/OrdersWidgets/OrdersCard.dart';
import 'package:ebuy/view/Widgets/Home/Settings/OrdersWidgets/OrdersRichText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTrackPage extends GetView<OrdersControllerimp> {
  const OrderTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My orders'.tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
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
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => OrdersCard(
                showPrice: false,
                index: index,
                ordersList: controller.ordersDetailesList),
            itemCount: controller.ordersDetailesList.length,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 380,
                width: 120,
                child: IconStepper(
                  activeStep:
                      int.parse(controller.ordersDetailesList[0].ordersStatus!),
                  lineColor: AppColors.primaryColor,
                  enableStepTapping: false,
                  activeStepBorderColor: AppColors.white,
                  activeStepColor: AppColors.primaryColor,
                  stepColor: AppColors.white,
                  stepPadding: 0,
                  alignment: Alignment.topLeft,
                  enableNextPreviousButtons: false,
                  scrollingDisabled: true,
                  icons: controller.orderTrackIcons,
                  direction: Axis.vertical,
                ),
              ),
              FittedBox(
                child: SizedBox(
                  width: UINumber.deviceWidth / 1.5,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    separatorBuilder: (context, index) => SizedBox(
                        height: controller.isEnglish == true
                            ? (65 - (index * 5))
                            : (45 - (index * 5))),
                    itemBuilder: (context, index) =>
                        OrdersRichText(index: index),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
