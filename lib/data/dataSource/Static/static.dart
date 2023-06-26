import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../model/CartModels/ShippingModel.dart';
import '../../model/CartModels/StepperModel.dart';
import '../../model/OnBoardingModel/OnBoardingModel.dart';

//onBoardingList

final List<OnBoardingModel> onBoardingdata = [
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageOne,
      title: 'View product 360 degrees'.tr,
      subtitle:
          'You can see the product with all angles, true and convenient'.tr),
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageTow,
      title: 'Find products easily'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar products for you.'
              .tr),
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageThree,
      title: 'Payment is easy'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar products for you.'
              .tr),
];
//Detailes List

const List<String> detailesTitles = [
  'Description',
  'Free delivery & returns',
  'Size guide',
];
//Check Out Lists

List<StepperModel> stepperList = [
  StepperModel(
    containerHeight: 30.0,
    borderRadius: 30,
    subtitle: 'Information',
  ),
  StepperModel(containerHeight: 25.0, borderRadius: 5, subtitle: 'Shipping'),
  StepperModel(containerHeight: 30.0, borderRadius: 30, subtitle: 'Payment')
];
const List<String> payMethods = [
  AppImagesAssets.visa,
  AppImagesAssets.payPal,
  AppImagesAssets.masterCard,
  AppImagesAssets.americanExpress,
  AppImagesAssets.klarna
];
List<String> notDoneOrdersStatus = [
  "Not delivired to shipping units yet",
  "Not shipped yet",
  "Not delivired yet"
];
