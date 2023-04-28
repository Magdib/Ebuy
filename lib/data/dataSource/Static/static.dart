import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/model/HomePageModels/FilterModel.dart';
import 'package:ebuy/data/model/ProductModels/ProductDetailesModel.dart';
import 'package:ebuy/data/model/ProductModels/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/CustomIcons.dart';
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
      title: 'Find TProducts easily'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar TProducts for you.'
              .tr),
  OnBoardingModel(
      image: AppImagesAssets.onBoardingImageThree,
      title: 'Payment is easy'.tr,
      subtitle:
          'You just need to take a photo or upload and we will find similar TProducts for you.'
              .tr),
];

List<String> brands = [
  "Frost",
  'Nike',
  'Adidas',
  'Vans',
  'The North face',
  'Collusion',
  'Calvin Klein',
  'Champion',
  'Fred Perry',
  'Fila',
  'Carhartt Wip',
  'Puma',
  'Levi\'s',
  'Tommy Hilfger',
  'Lascolate'
];
List<TProducts> userStyles = [
  TProducts(
      size: null,
      title: 'Fortnite T-shirt',
      subtitle: 'Just add kicks',
      image: AppImagesAssets.yourType1,
      liked: true,
      color: AppColors.black,
      disliked: false,
      price: 36,
      category: "T-shirt"),
  TProducts(
      size: null,
      title: 'black Short',
      subtitle: 'Just add kicks',
      image: AppImagesAssets.yourType2,
      liked: false,
      disliked: false,
      color: AppColors.black,
      price: 98,
      category: 'Short')
];

List<FilterModel> filterList = [
  FilterModel(title: 'Gender', type: ['All', 'Male', 'Female']),
  FilterModel(
      title: 'Product type',
      type: ['All', 'Shoes', 'Dress', 'Short', 'T-Shirt']),
  FilterModel(title: 'Style', type: ['All']),
  FilterModel(title: 'Color', type: [
    'All',
    'Black',
    'White',
    'Cyan',
    'Red',
    'Brown',
    'Orange',
    'Grey'
  ]),
  FilterModel(title: 'Brand', type: brands),
  FilterModel(title: 'Size', type: ['All', 'Medium', 'Large', 'X Large']),
];
List<String> detailesTitles = [
  'Description',
  'Free delivery & returns',
  'Size guide',
];

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
