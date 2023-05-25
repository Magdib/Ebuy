import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

abstract class OnBoardingController extends GetxController {
  next();
  pageChanged(int page);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  late Box authBox;
  int currentPage = 0;
  @override
  next() {
    if (currentPage == onBoardingdata.length - 1) {
      authBox.put(HiveKeys.islogin, '1');
      Get.offNamed(AppRoutes.signInRoute);
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
  void onInit() async {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() async {
    authBox = await Hive.openBox(HiveBoxes.authBox);
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
