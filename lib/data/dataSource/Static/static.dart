import 'package:ebuy/core/constant/Images.dart';
import 'package:get/get.dart';
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
//Check Out Lists

const List<String> payMethods = [
  AppImagesAssets.visa,
  AppImagesAssets.payPal,
  AppImagesAssets.masterCard,
  AppImagesAssets.americanExpress,
  AppImagesAssets.klarna
];
