import 'package:ebuy/Controller/Home/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 45,
          child: GetBuilder<CartControllerImp>(
            builder: (controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    height: controller.stepperList[index].containerHeight,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          controller.stepperList[index].borderRadius),
                      color: controller.currentStep < index
                          ? AppColors.grey
                          : AppColors.primaryColor,
                    ),
                  ),
                  index < 2
                      ? Container(
                          height: 2,
                          width: UINumber.deviceWidth / 3.5,
                          color: controller.currentStep < index + 1
                              ? AppColors.grey
                              : AppColors.primaryColor,
                        )
                      : Container(
                          height: 2,
                          margin: const EdgeInsets.symmetric(vertical: 28),
                          width: UINumber.deviceWidth / 3.5,
                          color: Theme.of(context).scaffoldBackgroundColor),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: GetBuilder<CartControllerImp>(
            builder: (controller) => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: UINumber.deviceWidth / 5,
                    ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Text(
                      controller.stepperList[index].subtitle,
                      style: index == controller.currentStep
                          ? Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 14)
                          : Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 14),
                    )),
          ),
        ),
      ],
    );
  }
}
