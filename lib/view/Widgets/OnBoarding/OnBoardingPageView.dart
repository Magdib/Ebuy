import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Controller/onBoardingController/OnBoardingController.dart';

import '../../../data/dataSource/Static/static.dart';

class OnBoardingPageView extends GetView<OnBoardingControllerImp> {
  const OnBoardingPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView.builder(
        onPageChanged: (page) => controller.pageChanged(page),
        controller: controller.pageController,
        itemCount: onBoardingdata.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SvgPicture.asset(onBoardingdata[index].image),
              const SizedBox(height: 80),
              Text(
                onBoardingdata[index].title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                onBoardingdata[index].subtitle,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
