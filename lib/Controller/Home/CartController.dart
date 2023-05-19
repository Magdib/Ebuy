import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/CartModels/StepperModel.dart';

abstract class CartController extends GetxController {
  void showDeleteButton(int index);
  void resetDeleteButton(PointerDownEvent event);
  void nextStep();
  void resetCheckOut();
  String getItemTotalPrice(int index);
}

class CartControllerImp extends CartController {
  List<Products> cartProducts = [];
  double totalPrice = 0.0;
  late int selectedIndex;
  late PageController pageController;
  List<StepperModel> stepperList = [
    StepperModel(
      containerHeight: 30.0,
      borderRadius: 30,
      subtitle: 'Information',
    ),
    StepperModel(containerHeight: 25.0, borderRadius: 5, subtitle: 'Shipping'),
    StepperModel(containerHeight: 30.0, borderRadius: 30, subtitle: 'Payment')
  ];
  int currentStep = 0;
  @override
  void showDeleteButton(int index) {
    cartProducts[index].cartDelete = true;
    update();
  }

  @override
  void resetDeleteButton(PointerDownEvent event) {
    if (event.localPosition.dx < UINumber.deviceWidth - 80) {
      for (int i = 0; i < cartProducts.length; i++) {
        cartProducts[i].cartDelete = false;
      }
      update();
    }
  }

  @override
  String getItemTotalPrice(int index) {
    double itemTotalPrice = double.parse(cartProducts[index].itemsPrice!) * 1;
    return itemTotalPrice.toString();
  }

  @override
  void nextStep() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    currentStep++;
    update();
  }

  @override
  void resetCheckOut() {
    pageController.jumpToPage(0);
    currentStep = 0;
    Get.back();
  }

  @override
  void onInit() {
    pageController = PageController();
    HomePageControllerImp homeController = Get.find();
    cartProducts.add(homeController.products.first);
    cartProducts.add(homeController.products[8]);
    for (int i = 0; i < cartProducts.length; i++) {
      totalPrice += double.parse(cartProducts[i].itemsPrice!);
    }
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
