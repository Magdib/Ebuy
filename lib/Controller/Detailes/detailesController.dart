import 'dart:io';

import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constant/Images.dart';
import '../../data/dataSource/Static/UINumbers.dart';
import '../../data/dataSource/remote/Favourite/FavouriteAddData.dart';
import '../../data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../data/model/ProductModels/ProductModel.dart';
import '../../data/model/ProductModels/RateModel.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class DetailesController extends GetxController {
  changeFavouriteState();
  likediLikeComment(int index);
  addItemsToFavourtie(int index);
  void handleProductImages();
  void shareProduct();
}

class DetailesControllerImp extends DetailesController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  PageController? pageController;
  DefaultCacheManager? caheManger;
  bool hideSliverAppBar = true;
  late Products product;
  late List<String> productDesc;
  FavouriteAddData favouriteAddData = FavouriteAddData(Get.find());
  FavouriteRemoveData favouriteRemoveData = FavouriteRemoveData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<String> productImages = [];
  List<RateModel> usersRate = [
    RateModel(
        username: 'Jack Bibber',
        userImage: AppImagesAssets.user1,
        comment:
            'Nike is a leading sports shoes brand in the world, with a youthful and dynamic',
        rate: 4.5,
        isLiked: false,
        rateTime: '09:30 - 23/09/2020'),
    RateModel(
        username: 'Vie Ruan',
        userImage: AppImagesAssets.user2,
        comment: 'Good, I Recommended it',
        rate: 4.0,
        isLiked: false,
        rateTime: '14:30 - 06/09/2020')
  ];
  bool isFavourite = false;

  @override
  changeFavouriteState() async {
    if (product.favourite == "0") {
      var response = await favouriteAddData.addToFavourite(
          authBox.get(HiveKeys.userid), product.itemsId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          product.favourite = "1";
          update();
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        noInternetSnackBar();
      } else {
        errorSnackBar('ُFailed', "Something went wrong please try again later");
      }
    } else {
      var response = await favouriteRemoveData.removeFromFavourite(
          authBox.get(HiveKeys.userid), product.itemsId!);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          product.favourite = "0";
          update();
        }
      } else if (statusRequest == StatusRequest.offlinefailure) {
        noInternetSnackBar();
      } else {
        errorSnackBar('ُFailed', "Something went wrong please try again later");
      }
    }
  }

  @override
  likediLikeComment(int index) {
    usersRate[index].isLiked = !usersRate[index].isLiked;
    update();
  }

  List<TProducts> suggestions = [
    TProducts(
        title: 'Yellow hoodie',
        subtitle: 'subtitle',
        image: AppImagesAssets.youMightAlsoLike1,
        liked: false,
        disliked: false,
        price: 130,
        category: '',
        color: Colors.yellow,
        size: ''),
    TProducts(
        title: 'Black hoodie',
        subtitle: 'subtitle',
        image: AppImagesAssets.youMightAlsoLike2,
        liked: false,
        disliked: false,
        price: 102,
        category: '',
        color: AppColors.black,
        size: '')
  ];
  @override
  addItemsToFavourtie(int index) {
    suggestions[index].liked = !suggestions[index].liked;
    update();
  }

  @override
  void handleProductImages() {
    productImages.add(product.itemsImage!);
    if (product.itemsImage2 != null) {
      productImages.add(product.itemsImage2!);
    }
    if (product.itemsImage3 != null) {
      productImages.add(product.itemsImage3!);
    }
    if (product.itemsImage4 != null) {
      productImages.add(product.itemsImage4!);
    }
  }

  @override
  void shareProduct() async {
    File image = await caheManger!.getSingleFile(
        "${AppServer.itemsImages}${productImages[pageController!.page!.toInt()]}");

    Share.shareXFiles(
      [XFile(image.path)],
      text: "${product.itemsName}\n price is: ${product.itemsPrice}\$",
    );
  }

  @override
  void onInit() {
    product = Get.arguments['Product'];
    productDesc = [
      product.itemsDesc!,
      product.itemsDeliveryRefund!,
      product.itemsSizeGuide!
    ];
    pageController = PageController();
    caheManger = DefaultCacheManager();

    handleProductImages();

    super.onInit();
  }

  @override
  void onClose() {
    pageController!.dispose();
    super.onClose();
  }
}
