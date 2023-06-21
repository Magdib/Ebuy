import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/view/Widgets/shared/AcceptedPayments.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UserAddressShipBox.dart';
import 'PayMethodListView.dart';
import 'TermsAndConditionText.dart';
import 'TotalPayCard.dart';

class Payment extends GetView<CheckOutControllerimp> {
  const Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        Text(
          'Payment',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<CheckOutControllerimp>(
          builder: (controller) => UserAddressShipBox(
              title: 'Postal address',
              userAddress: controller.paymentAddresList),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Payment type',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const PayMethodListView(),
        const AcceptedPayments(),
        const SizedBox(
          height: 20,
        ),
        const TotalPayCard(),
        const SizedBox(
          height: 15,
        ),
        const TermsAndConditionText(),
      ],
    );
  }
}
