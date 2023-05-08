import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/data/model/favouriteModel/favouriteModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/constant/ArgumentsNames.dart';
import '../../core/function/SnackBars.dart';
import '../../core/function/checkInternet.dart';
import '../../data/dataSource/remote/Favourite/getFavouriteData.dart';

abstract class FavouriteController extends GetxController {
  getData(bool showLoading);
  refreshData();
  void goToDetaielsPage(int index);
}

class FavouriteControllerImp extends FavouriteController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> tabs = [
    const Tab(text: "All Items"),
    const Tab(
      text: "Boards",
    )
  ];
  TabController? tabController;
  PageController? pageController;
  Box authBox = Hive.box(HiveBoxes.authBox);
  GetFavouriteData favouriteData = GetFavouriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<Favourite> favouriteItems = [];

  @override
  getData(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response =
        await favouriteData.getFavouriteData(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List favouriteList = response['data'];
        favouriteItems.addAll(favouriteList.map((e) => Favourite.fromJson(e)));
      }
    }
    update();
  }

  @override
  refreshData() async {
    if (await checkinternet()) {
      favouriteItems.clear();
      await getData(true);
    } else {
      noInternetSnackBar();
    }
  }

  @override
  void goToDetaielsPage(int index) {
    MainContrllerImp mainContrller = Get.find();
    mainContrller.somthingChange = true;
    HomePageControllerImp homeController = Get.find();
    Products product = homeController.products.firstWhere(
        (product) => product.itemsId!.contains(favouriteItems[index].itemsId!));
    Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
      ArgumentsNames.productD: product,
      ArgumentsNames.productListD: homeController.products
    });
  }

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    pageController = PageController();
    getData(false);
    super.onInit();
  }

  @override
  void onClose() {
    pageController!.dispose();
    tabController!.dispose();
    super.onClose();
  }
}
