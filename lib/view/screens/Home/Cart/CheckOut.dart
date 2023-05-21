import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/view/Widgets/Home/Cart/CustomStepper.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/Information/Information.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/payment/Payment.dart';
import 'package:ebuy/view/Widgets/Home/Cart/checkOut/shipping/Shipping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends GetView<CartControllerImp> {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => controller.resetCheckOut(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.grey,
            )),
      ),
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => WillPopScope(
          onWillPop: () => controller.resetCheckOut(),
          child: Column(
            children: [
              const CustomStepper(),
              Expanded(
                child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [Information(), Shipping(), Payment()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
