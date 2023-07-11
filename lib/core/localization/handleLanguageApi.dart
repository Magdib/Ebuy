import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/model/CartModels/CartModel.dart';
import 'package:ebuy/data/model/HomePageModels/BannersModel.dart';
import 'package:ebuy/data/model/HomePageModels/BrandsModel.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/data/model/ProductModels/OrdersMode.dart';
import 'package:ebuy/data/model/favouriteModel/favouriteModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../class/enums.dart';

bool getLanguage() {
  Box authBox = Hive.box(HiveBoxes.authBox);
  bool isenglish;
  if (authBox.get(HiveKeys.language) == null) {
    if (Get.deviceLocale!.languageCode.contains('ar') == true) {
      isenglish = false;
    } else {
      isenglish = true;
    }
  } else {
    isenglish = authBox.get(HiveKeys.language);
  }
  return isenglish;
}

String handleProductsLanguage(
    TranslationType translationType, Products product) {
  bool isenglish = getLanguage();
  switch (translationType) {
    case TranslationType.catDetailes:
      return isenglish == true
          ? product.itemsCatDetailes!
          : product.itemsCatDetailesAr!;
    case TranslationType.mainPW:
      return isenglish == true ? product.itemsMainPW! : product.itemsMainPWAr!;
    case TranslationType.description:
      return isenglish == true ? product.itemsDesc! : product.itemsDescAr!;
    case TranslationType.itemsName:
      return isenglish == true ? product.itemsName! : product.itemsNameAr!;

    default:
      return "";
  }
}

String handleCartLanguage(CartModel cartproduct) {
  bool isenglish = getLanguage();
  return isenglish == true ? cartproduct.itemsName! : cartproduct.itemsNameAr!;
}

String handleFavouriteLanguage(Favourite favProduct) {
  bool isenglish = getLanguage();
  return isenglish == true ? favProduct.itemsName! : favProduct.itemsNameAr!;
}

String handleOrdersLanguage(OrdersModel order) {
  bool isenglish = getLanguage();
  return isenglish == true ? order.itemsName! : order.itemsNameAr!;
}

handleBannersLanguage(TranslationType translationType, Banners banner) {
  bool isenglish = getLanguage();
  switch (translationType) {
    case TranslationType.bannerTitle:
      return isenglish == true ? banner.bannerTitle! : banner.bannerTitleAr!;
    default:
      return isenglish == true
          ? banner.bannerSubtitile!
          : banner.bannerSubtitileAr!;
  }
}

handleBrandsLanguage(BrandsModel brands) {
  bool isenglish = getLanguage();

  return isenglish == true ? brands.brandName! : brands.brandNameAr!;
}
