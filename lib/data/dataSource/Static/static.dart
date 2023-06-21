import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/ShopInDialog.dart';
import 'package:ebuy/routes.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../core/constant/CustomIcons.dart';
import '../../model/CartModels/ShippingModel.dart';
import '../../model/CartModels/StepperModel.dart';
import '../../model/OnBoardingModel/OnBoardingModel.dart';
import '../../model/authModels/AccountFListModel.dart';
import '../../model/authModels/AccountListModel.dart';

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

List<ShippingModel> shipRadioStatic = [
  ShippingModel(
      title: 'Free Standard Shipping',
      subtitle:
          'Delivered on or before ${Jiffy.now().add(days: 10).yMMMMEEEEd}',
      note: 'No shipping on Public Holidays',
      isSelected: true),
  ShippingModel(
      title: '\$10.00 Express Shipping',
      subtitle: 'Delivered on or before ${Jiffy.now().add(days: 4).yMMMMEEEEd}',
      isSelected: false),
  ShippingModel(
      title: '\$19.99 Express Shipping',
      subtitle: 'Delivered on ${Jiffy.now().add(days: 1).yMMMMEEEEd}',
      isSelected: false)
];

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
const List<Icon> orderTrackIcons = [
  Icon(
    Icons.shopping_cart,
    color: AppColors.white,
  ),
  Icon(
    FontAwesomeIcons.shop,
    color: AppColors.white,
  ),
  Icon(
    FontAwesomeIcons.truck,
    color: AppColors.white,
  ),
  Icon(
    Icons.favorite,
    color: AppColors.primaryColor,
  )
];
