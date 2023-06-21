import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/confirmPaymentDialog.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/CustomConditionButton.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:ebuy/view/Widgets/shared/DialogButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPayCard extends GetView<CheckOutControllerimp> {
  const TotalPayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        radius: 5,
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.placeOrderList[0][index],
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 14),
                          ),
                          Text(controller.placeOrderList[1][index],
                              style: Theme.of(context).textTheme.bodyText1),
                        ]),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: 3),
            const Divider(
              color: AppColors.brandsGrey,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total to pay',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '\$ 904.59',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            GetBuilder<CheckOutControllerimp>(
              builder: (controller) => CustomConditionButton(
                  text: 'Place order',
                  condition: controller.canPlaceOrder,
                  onPressed: () => confirmPaymentDialog(context)),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
