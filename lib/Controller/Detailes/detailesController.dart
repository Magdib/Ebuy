import 'dart:io';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/ReviewDialog.dart';
import 'package:ebuy/core/function/UiFunctions/SnackBars.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/constant/ArgumentsNames.dart';
import '../../core/function/UiFunctions/StringToColors.dart';
import '../../data/dataSource/remote/Detailes/CommentsData.dart';
import '../../data/dataSource/remote/Detailes/DetailesData.dart';
import '../../data/dataSource/remote/Favourite/FavouriteAddData.dart';
import '../../data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import '../../data/dataSource/remote/cart/CartData.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../data/model/ProductModels/CommentModel.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class DetailesController extends GetxController {
  getItemData(String? olditemid, bool showLoading);
  changeFavouriteState();
  void handleProductImages();
  void handleProductColors();
  void handleProductsSizes();
  void shareProduct();
  String? validateReview(String val);
  void saveReview(bool isEdit);
  void openReview(int index, BuildContext context);
  void deleteReview(int index);
  willPopReview();
  handleSimilarProduct(bool showLoading);
  void similarProductFavState(int index);
  void goToSimilarProduct(int index);
  void changeSelectedColor(int index);
  void changeSelectedSize(int index);
  void addToCart();
  void increaseAmount();
  void decreaseAmount();
  onWillPopSnackBar();
}

class DetailesControllerImp extends DetailesController {
  late String userid;
  DetailesData detailesData = DetailesData(Get.find());
  CartData cartData = CartData(Get.find());
  CommentsData commentsData = CommentsData(Get.find());
  FavouriteAddData favouriteAddData = FavouriteAddData(Get.find());
  FavouriteRemoveData favouriteRemoveData = FavouriteRemoveData(Get.find());
  Box authBox = Hive.box(HiveBoxes.authBox);
  PageController? imagesController;
  late TextEditingController reviewController;
  DefaultCacheManager? caheManger;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late List<Products> products;
  late Products product;
  late List<Products> recentProducts;
  late List<String> productDesc;
  String? olditemid;
  double rate = 0;
  int colorSelected = 0;
  int sizeSelected = 0;
  StatusRequest cartstatusRequest = StatusRequest.none;
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest commentStatusRequest = StatusRequest.none;
  StatusRequest deleteCommentStatus = StatusRequest.none;
  List<String> productImages = [];
  List<CommentModel> commentsList = [];
  List<CommentModel> currentCommentsList = [];
  List<Color> productColorsUI = [];
  List<String> productColorsString = [];
  List<Products> similarProducts = [];
  List<String> sizesLetter = [];
  List<String> sizes = [];

  int itemsAmount = 0;
  late int serverItemsAmount;
  int? editIndex;
  bool canAddToCart = false;
  bool isFavourite = false;
  @override
  getItemData(String? olditemid, bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response =
        await detailesData.getData(product.itemsId!, userid, olditemid);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (olditemid != null) {
        recentProducts.removeAt(0);
        recentProducts.add(product);
      }

      if (response['status'] == "success") {
        List tempCommentsList = response['comments'];
        commentsList
            .addAll(tempCommentsList.map((e) => CommentModel.fromJson(e)));
        currentCommentsList = commentsList
            .where((comment) => comment.itemsId!.contains(product.itemsId!))
            .toList();
        itemsAmount = int.parse(response['cartamount']);
        serverItemsAmount = int.parse(response['cartamount']);
        itemsAmount > 0 ? canAddToCart = true : canAddToCart = false;
      } else {
        itemsAmount = int.parse(response['cartamount']);
        serverItemsAmount = int.parse(response['cartamount']);
        itemsAmount > 0 ? canAddToCart = true : canAddToCart = false;
      }
    }

    update();
  }

  @override
  changeFavouriteState() async {
    await handleFavourite(product);
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
  String? validateReview(String val) {
    return val.isEmpty ? "Review text can't be empty!" : null;
  }

  @override
  void saveReview(bool isEdit) async {
    FormState? formData = formState.currentState;
    if (formData!.validate()) {
      commentStatusRequest = StatusRequest.loading;
      update();
      var response;
      if (isEdit == false) {
        response = await commentsData.addComment(authBox.get(HiveKeys.userid),
            product.itemsId!, "$rate", reviewController.text);
      } else {
        response = await commentsData.editComment(
            product.itemsId!,
            currentCommentsList[editIndex!].commentId!,
            "$rate",
            reviewController.text);
      }
      commentStatusRequest = handlingData(response);
      if (commentStatusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          willPopReview();
          commentsList.clear();
          currentCommentsList.clear();
          List tempCommentsList = response['data'];
          commentsList
              .addAll(tempCommentsList.map((e) => CommentModel.fromJson(e)));
          currentCommentsList = commentsList
              .where((comment) => comment.itemsId!.contains(product.itemsId!))
              .toList();
        }
      }
      update();
    }
  }

  @override
  void openReview(int index, BuildContext context) {
    editIndex = index;
    reviewController.text = currentCommentsList[index].commentBody!;
    rate = double.parse(currentCommentsList[index].commentRate!);
    reviewDialog(context);
  }

  @override
  void deleteReview(int index) async {
    editIndex = index;
    deleteCommentStatus = StatusRequest.loading;
    update();
    var response =
        await commentsData.deleteComment(currentCommentsList[index].commentId!);
    deleteCommentStatus = handlingData(response);
    if (deleteCommentStatus == StatusRequest.success) {
      if (response['status'] == "success") {
        currentCommentsList.removeAt(index);
        editIndex = null;
      }
    }
    update();
  }

  @override
  willPopReview() {
    Get.back();
    rate = 0;
    reviewController.clear();
    editIndex = null;
    return Future.value(false);
  }

  @override
  handleSimilarProduct(bool showLoading) async {
    if (recentProducts.length >= 2) {
      if (recentProducts[1] != product) {
        olditemid = recentProducts[0].itemsId!;
      } else {
        olditemid = recentProducts[1].itemsId!;
      }
    }
    colorSelected = 0;
    sizeSelected = 0;
    handleProductImages();
    handleProductColors();
    handleProductsSizes();
    await getItemData(olditemid, showLoading);

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
  void goToSimilarProduct(int index) async {
    product = similarProducts[index];
    sizes.clear();
    sizesLetter.clear();
    productColorsUI.clear();
    productColorsString.clear();
    similarProducts.clear();
    productImages.clear();
    commentsList.clear();
    currentCommentsList.clear();
    await handleSimilarProduct(true);
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
    cartstatusRequest = StatusRequest.none;
    Get.back();
    return Future.value(false);
  }

  @override
  void addToCart() async {
    cartstatusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addToCart(
        authBox.get(HiveKeys.userid),
        product.itemsId!,
        productColorsString[colorSelected],
        sizes[sizeSelected],
        "${itemsAmount - serverItemsAmount}");
    cartstatusRequest = handlingData(response);
    serverItemsAmount = 0;
    if (cartstatusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemsAmount = int.parse(response['data']);
        serverItemsAmount = int.parse(response['data']);
      }
      itemsAmount > 0 ? canAddToCart = true : canAddToCart = false;
      Get.back();
      succesSnackBar(
          'Done.', 'your product have been successfully added to the cart ');
    } else {
      noInternetSnackBar();
    }
  }

  @override
  void onInit() {
    userid = authBox.get(HiveKeys.userid);
    product = Get.arguments[ArgumentsNames.productD];
    products = Get.arguments[ArgumentsNames.productListD];
    recentProducts = Get.arguments[ArgumentsNames.recentProducts];

    productDesc = [
      product.itemsDesc!,
      product.itemsDeliveryRefund!,
      product.itemsSizeGuide!
    ];
    imagesController = PageController();
    reviewController = TextEditingController();
    caheManger = DefaultCacheManager();
    handleSimilarProduct(false);
    String size = product.itemsSize![0];
    sizeSelected =
        sizesLetter.indexWhere((tempSize) => tempSize.contains(size));
    super.onInit();
  }

  @override
  void onClose() {
    imagesController!.dispose();

    reviewController.dispose();
    super.onClose();
  }
}
