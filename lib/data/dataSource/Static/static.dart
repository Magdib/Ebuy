import 'package:ebuy/core/constant/Images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../core/constant/CustomIcons.dart';
import '../../model/CartModels/ShippingModel.dart';
import '../../model/CartModels/StepperModel.dart';
import '../../model/OnBoardingModel/OnBoardingModel.dart';
import '../../model/authModels/AccountListTileModel.dart';

//onBoardingList

List<OnBoardingModel> onBoardingdata = [
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageOne,
      title: 'View product 360 degrees'.tr,
      subtitle:
          'You can see the product with all angles, true and convenient'.tr),
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageTow,
      title: 'Find Products easily'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar Products for you.'
              .tr),
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageThree,
      title: 'Payment is easy'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar Products for you.'
              .tr),
];
//Detailes List

List<String> detailesTitles = [
  'Description',
  'Free delivery & returns',
  'Size guide',
];
// Settings List

List<AccountListTileModel> accountPageUpperList = [
  AccountListTileModel(leadingIcon: CustomIcons.boxIcon, text: 'My order'),
  AccountListTileModel(
      leadingIcon: CustomIcons.crownIcon, text: 'Premier Delivery')
];
List<AccountListTileModel> accountPageLowerList = [
  AccountListTileModel(leadingIcon: Icons.square, text: 'My details'),
  AccountListTileModel(
      leadingIcon: Icons.location_on_rounded, text: 'Address book'),
  AccountListTileModel(leadingIcon: Icons.credit_card, text: 'Payment methods'),
  AccountListTileModel(
      leadingIcon: CustomIcons.meetingIcon, text: 'Contact preferences'),
  AccountListTileModel(
      leadingIcon: CustomIcons.personIcon, text: 'Social accounts')
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
      subtitle: 'Delivered on or before ${Jiffy.now().add(days: 5).yMMMMEEEEd}',
      isSelected: false),
  ShippingModel(
      title: '\$19.99 Express Shipping',
      subtitle: 'Delivered on ${Jiffy.now().add(days: 2).yMMMMEEEEd}',
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
List<String> payMethods = [
  AppImagesAssets.visa,
  AppImagesAssets.payPal,
  AppImagesAssets.masterCard,
  AppImagesAssets.americanExpress,
  AppImagesAssets.klarna
];
