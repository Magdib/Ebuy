import 'package:ebuy/Controller/Home/SettingsControllers/OrdersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersRichText extends GetView<OrdersControllerimp> {
  const OrdersRichText({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: '${controller.ordersTrackText[index]}\n',
          style: index <=
                  int.parse(controller.ordersDetailesList[0].ordersStatus!)
              ? Theme.of(context).textTheme.headline2!.copyWith(fontSize: 18)
              : Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
        ),
        TextSpan(
          text:
              index <= int.parse(controller.ordersDetailesList[0].ordersStatus!)
                  ? controller.orderStatusTime[index]
                  : controller.notDoneOrdersStatus[index - 1],
          style: index <=
                  int.parse(controller.ordersDetailesList[0].ordersStatus!)
              ? Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 15, height: 1.5)
              : Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15),
        )
      ]),
    );
  }
}
