import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:ebuy/view/Widgets/Home/Cart/CartItemsListView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return SafeArea(
        child: Scaffold(
      appBar: customAppBar("Cart".tr, context, 0),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => HandlingDataView(
          onPressed: () => controller.getCartItems(true),
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Listener(
              onPointerDown: (e) => controller.resetDeleteButton(e),
              child: Column(
                children: [
                  const CartItemsListView(),
                  SizedBox(
                    height: controller.isEnglish == true ? 115 : 118,
                    width: UINumber.deviceWidth,
                    child: Card(
                      margin: EdgeInsets.only(
                          bottom: controller.isEnglish == true ? 5 : 0,
                          left: 10,
                          right: 10),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 15.0, bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total:".tr,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  "\$ ${controller.totalPrice.toStringAsFixed(2)}",
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                              onPressed: () => Get.toNamed(
                                  AppRoutes.checkOutRoute,
                                  arguments: {
                                    ArgumentsNames.cartProducts:
                                        controller.argumentCartProducts,
                                    ArgumentsNames.cartTotalPrice:
                                        controller.totalPrice,
                                  }),
                              height: 50,
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: AppColors.primaryColor,
                              child: Text(
                                'Checkout'.tr,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
