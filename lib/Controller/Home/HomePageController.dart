import 'dart:math';

import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/remote/home/homeData.dart';
import 'package:ebuy/data/model/HomePageModels/ProductsSortModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../core/function/SnackBars.dart';
import '../../core/function/checkInternet.dart';
import '../../data/dataSource/Static/HiveKeys.dart';
import '../../data/model/HomePageModels/BannersModel.dart';
import '../../data/model/HomePageModels/itemsModel.dart';

abstract class HomePageController extends GetxController {
  void sortProducts(int index);
  void changePriceRange(SfRangeValues range);
  getData(bool showLoading);
  refreshPage();
}

class HomePageControllerImp extends HomePageController {
  //SavedItems
  List<ProductsSort> productsSort = [
    ProductsSort(type: 'Recommended', choosenSort: true),
    ProductsSort(type: 'What\'s New', choosenSort: false),
    ProductsSort(type: 'Price: High to low', choosenSort: false),
    ProductsSort(type: 'Price: Low to high', choosenSort: false)
  ];
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List<Products> products = [];
  List<Banners> banners = [];
  StatusRequest statusRequest = StatusRequest.none;
  @override
  getData(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List itemsList = response['items'];
        List bannersList = response['banners'];
        categories.addAll(response['categories']);

        products.addAll(itemsList.map((e) => Products.fromJson(e)));
        banners.addAll(bannersList.map((e) => Banners.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  sortProducts(int index) async {
    productsSort[index].choosenSort = true;
    for (int i = 0; i < 4; i++) {
      if (i == index) {
        continue;
      }
      productsSort[i].choosenSort = false;
    }

    update();
    await Future.delayed(const Duration(milliseconds: 250));
    Get.back();
  }

  //Price Range
  SfRangeValues priceRang = const SfRangeValues(8, 385);

  @override
  changePriceRange(SfRangeValues range) {
    priceRang = range;
    update();
  }

  @override
  refreshPage() async {
    if (await checkinternet()) {
      products.clear();
      categories.clear();
      banners.clear();
      await getData(false);
    } else {
      errorSnackBar(
          "No internet connection", "Please check your internet and try again");
    }
  }

  @override
  void onInit() {
    getData(true);

    super.onInit();
  }
}
