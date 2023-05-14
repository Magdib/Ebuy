import 'dart:io';

import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constant/ArgumentsNames.dart';
import '../../core/constant/Images.dart';
import '../../data/dataSource/remote/Favourite/FavouriteAddData.dart';
import '../../data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../data/model/ProductModels/RateModel.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../routes.dart';

abstract class DetailesController extends GetxController {
  changeFavouriteState();
  likediLikeComment(int index);
  void handleProductImages();
  void shareProduct();
  void handleSimilarProduct();
  void similarProductFavState(int index);
  void goToSimilarProduct(int index);
}

class DetailesControllerImp extends DetailesController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  PageController? imagesController;
  ScrollController? scrollController;
  DefaultCacheManager? caheManger;
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
        "${AppServer.itemsImages}${productImages[imagesController!.page!.toInt()]}");

    Share.shareXFiles(
      [XFile(image.path)],
      text: "${product.itemsName}\n price is: ${product.itemsPrice}\$",
    );
  }

  @override
  void handleSimilarProduct() {
    handleProductImages();
    products.removeWhere((currentProduct) =>
        currentProduct.itemsName!.contains(product.itemsName!));

    similarProducts = products
        .where((similarProduct) =>
            similarProduct.itemsColor!.contains(product.itemsColor!))
        .toList();

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
  }

  @override
  void similarProductFavState(index) async {
    await handleFavourite(similarProducts[index]);
    update();
  }

  @override
  void goToSimilarProduct(int index) {
    product = similarProducts[index];
    similarProducts.clear();
    handleSimilarProduct();
    productImages.clear();
    handleProductImages();
    scrollController!.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  @override
  void onInit() {
    product = Get.arguments[ArgumentsNames.productD];
    products = Get.arguments[ArgumentsNames.productListD];
    productDesc = [
      product.itemsDesc!,
      product.itemsDeliveryRefund!,
      product.itemsSizeGuide!
    ];
    imagesController = PageController();
    scrollController = ScrollController();
    caheManger = DefaultCacheManager();
    handleSimilarProduct();

    super.onInit();
  }

  @override
  void onClose() {
    imagesController!.dispose();
    scrollController!.dispose();
    super.onClose();
  }
}
