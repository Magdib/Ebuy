import 'dart:io';

import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constant/ArgumentsNames.dart';
import '../../core/constant/Images.dart';
import '../../core/function/UiFunctions/StringToColors.dart';
import '../../data/dataSource/remote/Favourite/FavouriteAddData.dart';
import '../../data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import '../../data/dataSource/remote/cart/CartData.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../data/model/ProductModels/RateModel.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class DetailesController extends GetxController {
  changeFavouriteState();
  likediLikeComment(int index);
  void handleProductImages();
  void handleProductColors();
  void handleProductsSizes();
  void shareProduct();
  void handleSimilarProduct();
  void similarProductFavState(int index);
  void goToSimilarProduct(int index);
  void changeSelectedColor(int index);
  void changeSelectedSize(int index);
  void addToCart();
  getItemsCount();
  void increaseAmount();
  void decreaseAmount();
  onWillPopSnackBar();
}

class DetailesControllerImp extends DetailesController {
  CartData cartData = CartData(Get.find());
  Box authBox = Hive.box(HiveBoxes.authBox);
  PageController? imagesController;
  ScrollController? scrollController;
  DefaultCacheManager? caheManger;
  late List<Products> products;
  late Products product;
  late List<String> productDesc;
  int colorSelected = 0;
  late int sizeSelected;
  FavouriteAddData favouriteAddData = FavouriteAddData(Get.find());
  FavouriteRemoveData favouriteRemoveData = FavouriteRemoveData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<String> productImages = [];
  List<Color> productColorsUI = [];
  List<String> productColorsString = [];
  List<Products> similarProducts = [];
  List<String> sizesLetter = [];
  List<String> sizes = [];
  int itemsAmount = 0;
  late int serverItemsAmount;
  bool canAddToCart = false;
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
  void handleProductColors() {
    productColorsUI.add(stringToColor(product.itemsColor!));
    productColorsString.add(product.itemsColor!);
    if (product.itemsColor2 != null) {
      productColorsUI.add(stringToColor(product.itemsColor2!));
      productColorsString.add(product.itemsColor2!);
    }
    if (product.itemsColor3 != null) {
      productColorsUI.add(stringToColor(product.itemsColor3!));
      productColorsString.add(product.itemsColor3!);
    }
    if (product.itemsColor4 != null) {
      productColorsUI.add(stringToColor(product.itemsColor4!));
      productColorsString.add(product.itemsColor4!);
    }
  }

  @override
  void handleProductsSizes() {
    sizesLetter.add(product.itemsSize![0]);
    sizes.add(product.itemsSize!);
    if (product.itemsSize2 != null) {
      sizesLetter.add(product.itemsSize2![0]);
      sizes.add(product.itemsSize2!);
    }
    if (product.itemsSize3 != null) {
      sizesLetter.add(product.itemsSize3![0]);
      sizes.add(product.itemsSize3!);
    }
    if (product.itemsSize4 != null) {
      sizesLetter.add(product.itemsSize4![0] + product.itemsSize4![2]);
      sizes.add(product.itemsSize4!);
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
    colorSelected = 0;
    sizeSelected = 0;
    getItemsCount();
    handleProductImages();
    handleProductColors();
    handleProductsSizes();
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
    sizes.clear();
    sizesLetter.clear();
    productColorsUI.clear();
    productColorsString.clear();

    similarProducts.clear();
    productImages.clear();
    handleSimilarProduct();

    scrollController!.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  @override
  void changeSelectedColor(int index) {
    colorSelected = index;
    update();
  }

  @override
  void changeSelectedSize(int index) {
    sizeSelected = index;
    update();
  }

  @override
  getItemsCount() async {
    var response = await cartData.getItemCount(
        authBox.get(HiveKeys.userid), product.itemsId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemsAmount = int.parse(response['data']);
        serverItemsAmount = int.parse(response['data']);
      }
      itemsAmount > 0 ? canAddToCart = true : canAddToCart = false;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void increaseAmount() {
    if (itemsAmount < double.parse(product.itemsCount!)) {
      itemsAmount++;
      canAddToCart = true;
    }
    update();
  }

  @override
  void decreaseAmount() {
    if (itemsAmount > 0) {
      itemsAmount--;
    }
    if (itemsAmount < serverItemsAmount) {
      canAddToCart = false;
    }
    update();
  }

  @override
  onWillPopSnackBar() {
    statusRequest = StatusRequest.none;
    Get.back();
    return Future.value(false);
  }

  @override
  void addToCart() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addToCart(
        authBox.get(HiveKeys.userid),
        product.itemsId!,
        productColorsString[colorSelected],
        sizes[sizeSelected],
        "${itemsAmount - serverItemsAmount}");
    statusRequest = handlingData(response);
    serverItemsAmount = 0;
    await getItemsCount();
    update();
    if (statusRequest == StatusRequest.success) {
      Get.back();
      succesSnackBar(
          'Done.', 'your product have been successfully added to the cart ');
    } else {
      noInternetSnackBar();
    }
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
    String size = product.itemsSize![0];
    sizeSelected =
        sizesLetter.indexWhere((tempSize) => tempSize.contains(size));
    super.onInit();
  }

  @override
  void onClose() {
    imagesController!.dispose();
    scrollController!.dispose();
    super.onClose();
  }
}
