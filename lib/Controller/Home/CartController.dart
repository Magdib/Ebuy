import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/model/CartModels/CartAddressModel.dart';
import '../../data/model/CartModels/ShippingModel.dart';

abstract class CartController extends GetxController {
  void showDeleteButton(int index);
  void resetDeleteButton(PointerDownEvent event);
  String getItemTotalPrice(int index);
  void changeShipWay(int index);
  void choosePayMethod(int index);
  resetCheckOut();
  void nextStep();
}

class CartControllerImp extends CartController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  List<Products> cartProducts = [];
  double totalPrice = 0.0;
  late int selectedIndex;
  late PageController pageController;
  List<Color> stepsColors = [
    AppColors.primaryColor,
    AppColors.grey,
    AppColors.grey
  ];
  int? selectedPayment;
  List<String> paymentMethods = [
    AppImagesAssets.payPal,
    AppImagesAssets.klarna,
  ];
  late List<List<String>> placeOrderList;
  int shipLastIndex = 0;
  List<ShippingModel> shipRadioList = shipRadioStatic;
  late List<CartAddressModel> addressList;
  String shipWay = 'Free';
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
  void changeShipWay(int index) {
    shipRadioList[shipLastIndex].isSelected = false;
    shipLastIndex = index;
    shipRadioList[index].isSelected = true;
    shipWay = shipRadioList[index].title.replaceRange(4, null, '');
    update();
  }

  @override
  void choosePayMethod(int index) {
    selectedPayment = index;
    update();
  }

  @override
  void nextStep() {
    if (currentStep == 1) {
      placeOrderList = [
        ['Sub - total', 'Shipping', 'Sale tax'],
        ['\$$totalPrice', shipWay, "\$4.70"]
      ];
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    currentStep++;
    stepsColors[currentStep] = AppColors.primaryColor;

    update();
  }

  @override
  resetCheckOut() {
    pageController.jumpToPage(0);
    currentStep = 0;
    stepsColors = [AppColors.primaryColor, AppColors.grey, AppColors.grey];
    Get.back();
  }

  @override
  void onInit() {
    print(shipWay = shipRadioList[0].title[5]);
    addressList = [
      CartAddressModel(
          title: authBox.get(HiveKeys.username), icon: Icons.person),
      CartAddressModel(title: '', icon: Icons.location_on_outlined),
      CartAddressModel(title: '', icon: Icons.amp_stories_rounded)
    ];
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
