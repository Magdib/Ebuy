import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UserAddressShipBox.dart';
import 'PayMethodListView.dart';
import 'TermsAndConditionText.dart';
import 'TotalPayCard.dart';

class Payment extends GetView<CartControllerImp> {
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
        GetBuilder<CartControllerImp>(
          builder: (controller) => UserAddressShipBox(
              title: 'Postal address', userAddress: controller.addressList),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Payment type',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        const PayMethodListView(),
        Text(
          'We accept',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustomContainer(
                  height: 40,
                  width: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    payMethods[index],
                  )),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: payMethods.length),
        ),
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
