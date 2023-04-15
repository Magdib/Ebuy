import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavouriteController extends GetxController {
  changePage(int page);
}

class FavouriteControllerImp extends FavouriteController {
  int currentPage = 0;
  final PageController pageController = PageController();
  @override
  changePage(int page) {
    currentPage = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    update();
  }
}
