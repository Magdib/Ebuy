import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';
import '../../../Widgets/Home/Cart/CartItemsListView.dart';

class CartPage extends GetView<MainContrllerImp> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartControllerImp());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => controller.changePage(0),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.deepGrey,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Listener(
          onPointerDown: (e) => cartController.resetDeleteButton(e),
          child: Column(
            children: [
              const CartItemsListView(),
              SizedBox(
                height: 130,
                width: UINumber.deviceWidth,
                child: Card(
                  margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 20.0, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              "\$ ${cartController.totalPrice}",
                              style: Theme.of(context).textTheme.headline2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () => Get.toNamed(AppRoutes.checkOutRoute),
                          height: 54,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: AppColors.primaryColor,
                          child: Text(
                            'Checkout',
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
    ));
  }
}
