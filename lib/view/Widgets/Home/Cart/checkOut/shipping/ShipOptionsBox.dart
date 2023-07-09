import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/shared/CustomContainer.dart';
import 'package:ebuy/view/Widgets/shared/CustomRadio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/GreyDivider.dart';

class ShipOptionsBox extends GetView<CheckOutControllerimp> {
  const ShipOptionsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child: ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) => const GreyDivider(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<CheckOutControllerimp>(
              builder: (controller) => CustomRadio(
                  onTap: () => controller.changeShipWay(index),
                  condition: controller.shipRadioList[index].isSelected,
                  radius: 24),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.shipRadioList[index].title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: UINumber.deviceWidth / 1.3,
                  child: Text(
                    controller.shipRadioList[index].subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                index == 0
                    ? Column(
                        children: [
                          Row(
                            children: [
                              const CustomRadio(condition: false, radius: 16),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                controller.shipRadioList[index].note!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
