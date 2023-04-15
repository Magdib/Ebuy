import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  pageChanged(int page);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    if (currentPage == onBoardingdata.length - 1) {
      Get.toNamed(AppRoutes.signInRoute);
      currentPage = onBoardingdata.length - 2;
    }
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  pageChanged(int page) {
    currentPage = page;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
