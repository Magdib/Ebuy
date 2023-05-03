import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/Favourite/FavouriteAddData.dart';
import 'package:ebuy/data/dataSource/remote/Favourite/favouriteRemoveData.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'SnackBars.dart';
import 'handleData.dart';

handleFavourite(
  Products product,
) async {
  Box authBox = Hive.box(HiveBoxes.authBox);
  StatusRequest statusRequest;
  if (product.favourite == "0") {
    FavouriteAddData favouriteAddData = FavouriteAddData(Get.find());
    var response = await favouriteAddData.addToFavourite(
        authBox.get(HiveKeys.userid), product.itemsId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        product.favourite = "1";
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      noInternetSnackBar();
    } else {
      errorSnackBar('ُFailed', "Something went wrong please try again later");
    }
  } else {
    FavouriteRemoveData favouriteRemoveData = FavouriteRemoveData(Get.find());
    var response = await favouriteRemoveData.removeFromFavourite(
        authBox.get(HiveKeys.userid), product.itemsId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        product.favourite = "0";
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      noInternetSnackBar();
    } else {
      errorSnackBar('ُFailed', "Something went wrong please try again later");
    }
  }
}
