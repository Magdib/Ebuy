import 'package:ebuy/Controller/Home/CheckOutController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: GetBuilder<CheckOutControllerimp>(
            builder: (controller) => ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInCubic,
                    height: controller.stepperList[index].containerHeight,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          controller.stepperList[index].borderRadius),
                      color: controller.stepsColors[index],
                    ),
                  ),
                  index < 2
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.linear,
                          height: 3,
                          width: UINumber.deviceWidth / 3,
                          color: controller.stepsColors[index + 1],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: GetBuilder<CheckOutControllerimp>(
            builder: (controller) => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                      width: controller.isEnglish == true
                          ? UINumber.deviceWidth / 5
                          : UINumber.deviceWidth / 3,
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
