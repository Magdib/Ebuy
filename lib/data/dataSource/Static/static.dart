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

List<String> brands = [
  "All",
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
List<Products> userStyles = [
  Products(
      size: null,
      title: 'Fortnite T-shirt',
      subtitle: 'Just add kicks',
      image: AppImagesAssets.yourType1,
      liked: true,
      color: AppColors.black,
      disliked: false,
      price: 36,
      category: "T-shirt"),
  Products(
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
List<Products> newTrend = [
  Products(
      size: null,
      title: 'White Hand bag',
      subtitle: 'just and kicks',
      image: AppImagesAssets.newTrend1,
      liked: true,
      disliked: false,
      color: AppColors.black,
      price: 102,
      category: 'handBag'),
  Products(
      size: null,
      title: 'Summer co-ords',
      subtitle: 'Just add kicks',
      image: AppImagesAssets.product1,
      disliked: false,
      liked: false,
      color: AppColors.black,
      category: "Dress",
      price: 87),
  Products(
      size: null,
      title: 'blue shoes',
      subtitle: 'stay cool',
      image: AppImagesAssets.newTrend2,
      liked: false,
      disliked: false,
      color: AppColors.black,
      price: 201,
      category: 'Shoes'),
  Products(
      size: null,
      title: 'black Short',
      subtitle: 'Just add kicks',
      image: AppImagesAssets.yourType2,
      liked: true,
      disliked: false,
      price: 98,
      color: AppColors.black,
      category: 'Short')
];
List<Products> savedItems = [
  Products(
    size: null,
    title: 'White Hand bag',
    subtitle: 'just and kicks',
    image: AppImagesAssets.newTrend1,
    liked: true,
    disliked: false,
    category: 'handBag',
    price: 102,
    color: AppColors.primaryColor,
  ),
  Products(
    size: 'XL',
    title: 'Fortnite T-shirt',
    subtitle: 'Just add kicks',
    image: AppImagesAssets.yourType1,
    liked: true,
    disliked: false,
    price: 36,
    category: "T-shirt",
    color: AppColors.grey,
  ),
  Products(
    size: 'M',
    title: 'black Short',
    subtitle: 'Just add kicks',
    image: AppImagesAssets.yourType2,
    liked: false,
    disliked: false,
    price: 98,
    category: 'Short',
    color: AppColors.black,
  ),
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
List<ProductDetailesModel> detailesPageTitleSubtitle = [
  ProductDetailesModel(
      title: 'Description',
      subtitle:
          'Nike, originally known as Blue Ribbon Sports (BRS), was founded by University of Oregon track athlete Phil Knight and his coach, Bill Bowerman, on January 25, 1964.[11] The company initially operated in Eugene, Oregon as a distributor for Japanese shoe maker Onitsuka Tiger, making most sales at track meets out of Knight\'s '),
  ProductDetailesModel(
      title: 'Free delivery & returns',
      subtitle:
          'Nike, originally known as Blue Ribbon Sports (BRS), was founded by University of Oregon track athlete Phil Knight and his coach, Bill Bowerman '),
  ProductDetailesModel(
      title: 'Size guide',
      subtitle:
          'In a company public announcement on March 15, 2018, Nike CEO Mark Parker said Trevor Edwards, a top Nike executive who was seen as a potential successor to the chief executive, was ')
];
List<String> productImages = [
  AppImagesAssets.detailes1,
  AppImagesAssets.detailes2,
  AppImagesAssets.detailes3,
  AppImagesAssets.detailes4
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
