import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/view/Widgets/shared/AcceptedPayments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UserAddressShipBox.dart';
import 'PayMethodListView.dart';
import 'TermsAndConditionText.dart';
import 'TotalPayCard.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutControllerimp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.placeOrder(),
        statusRequest: controller.orderStatusRequest,
        widget: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          children: [
            Text(
              'Payment'.tr,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<CheckOutControllerimp>(
              builder: (controller) => UserAddressShipBox(
                  title: 'Postal address'.tr,
                  userAddress: controller.paymentAddresList),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Payment type'.tr,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
            const PayMethodListView(),
            const ConstAcceptedPayments(),
            const SizedBox(
              height: 20,
            ),
            const TotalPayCard(),
            const SizedBox(
              height: 15,
            ),
            const TermsAndConditionText(),
          ],
        ),
      ),
    );
  }
}
