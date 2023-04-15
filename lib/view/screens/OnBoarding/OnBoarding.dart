import 'package:ebuy/Controller/onBoardingController/OnBoardingController.dart';
import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Widgets/OnBoarding/OnBoardingPageView.dart';
import '../../Widgets/shared/CustomButton.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              const OnBoardingPageView(),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmoothPageIndicator(
                          controller: controller.pageController,
                          count: onBoardingdata.length,
                          effect: const WormEffect(
                              activeDotColor: AppColors.primaryColor,
                              radius: 16,
                              dotHeight: 6,
                              dotWidth: 6)),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'Get Started!'.tr,
                        onPressed: () => controller.next(),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
