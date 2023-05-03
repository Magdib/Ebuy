import 'dart:io';

import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constant/Images.dart';
import '../../data/dataSource/remote/Favourite/FavouriteAddData.dart';
import '../../data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../data/model/ProductModels/RateModel.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class DetailesController extends GetxController {
  changeFavouriteState();
  likediLikeComment(int index);
  void handleProductImages();
  void shareProduct();
  void similarProductFavState(int index);
}

class DetailesControllerImp extends DetailesController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  PageController? pageController;
  DefaultCacheManager? caheManger;
  // bool hideSliverAppBar = true;
  late List<Products> products;
  late Products product;
  late List<String> productDesc;
  FavouriteAddData favouriteAddData = FavouriteAddData(Get.find());
  FavouriteRemoveData favouriteRemoveData = FavouriteRemoveData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<String> productImages = [];
  List<Products> similarProducts = [];
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
    await handleFavourite(product);
    update();
  }

  @override
  void similarProductFavState(index) async {
    await handleFavourite(similarProducts[index]);
    update();
  }

  @override
  likediLikeComment(int index) {
    usersRate[index].isLiked = !usersRate[index].isLiked;
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
    products = Get.arguments["ProductsList"];
    productDesc = [
      product.itemsDesc!,
      product.itemsDeliveryRefund!,
      product.itemsSizeGuide!
    ];
    pageController = PageController();
    caheManger = DefaultCacheManager();
    handleProductImages();
    similarProducts = products
        .where((similarProduct) =>
            similarProduct.itemsColor!.contains(product.itemsColor!))
        .toList();
    for (int i = 0; i < similarProducts.length; i++) {
      if (similarProducts[i].itemsName!.contains(product.itemsName!)) {
        similarProducts.removeAt(i);
      }
    }
    if (similarProducts.length < 2) {
      similarProducts.addAll(products.where((similarProduct) =>
          similarProduct.categoriesName!.contains(product.categoriesName!)));
      if (similarProducts.length < 2) {
        similarProducts.addAll(products
            .where((similarProduct) =>
                similarProduct.itemsBrand!.contains(product.itemsBrand!))
            .toList());
        if (similarProducts.length < 2) {
          similarProducts.addAll([products[0], products[1]]);
        }
      }
    }
    similarProducts.removeRange(2, similarProducts.length);

    super.onInit();
  }

  @override
  void onClose() {
    pageController!.dispose();
    super.onClose();
  }
}
