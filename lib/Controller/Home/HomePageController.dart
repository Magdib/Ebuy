import 'dart:math';

import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/home/homeData.dart';
import 'package:ebuy/data/model/HomePageModels/CategoriesModel.dart';
import 'package:ebuy/data/model/HomePageModels/ColorsModel.dart';
import 'package:ebuy/data/model/HomePageModels/ProductsSortModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../core/constant/ArgumentsNames.dart';
import '../../core/function/UiFunctions/SnackBars.dart';
import '../../core/function/checkInternet.dart';
import '../../core/function/getProductIndex.dart';
import '../../data/dataSource/remote/home/RecentData.dart';
import '../../data/model/HomePageModels/BannersModel.dart';
import '../../data/model/HomePageModels/BrandsModel.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../routes.dart';

abstract class HomePageController extends GetxController {
  void sortProducts(int index);
  getData(bool showLoading);
  refreshPage();
  onwillpop();
  void handleRecentFavourite();
  void addToFavourite(int index);
  void recentToDetailes(int index);
  void addStyleToFavourite(int index);
}

class HomePageControllerImp extends HomePageController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  bool canReGetData = true;
  late List<ProductsSort> productsSort;
  HomeData homeData = HomeData(Get.find());
  RecentAddData recentAddData = RecentAddData(Get.find());
  RecentRemoveData recentRemoveData = RecentRemoveData(Get.find());
  late int firstRecentIndex;
  late int secondeRecentIndex;
  List<Products> products = [];
  List<Products> homeProducts = [];
  List<Products> newTrend = [];
  List<Banners> banners = [];
  List<Banners> allBanners = [];
  List<Products> savedItems = [];
  List<Products> newProducts = [];
  List<BrandsModel> brands = [];
  List<Products> recentProduct = [];
  List<Products> userStyle = [];
  List<ColorsModel> colors = [];
  List<Categories> categories = [];
  List<Products> sortedProducts = [];
  late bool isEnglish;
  int lastSortIndex = 0;
  StatusRequest statusRequest = StatusRequest.loading;
  @override
  getData(bool showLoading) async {
    productsSort = [
      ProductsSort(type: 'Recommended'.tr, choosenSort: true),
      ProductsSort(type: 'What\'s New'.tr, choosenSort: false),
      ProductsSort(type: 'Price: High to low'.tr, choosenSort: false),
      ProductsSort(type: 'Price: Low to high'.tr, choosenSort: false)
    ];
    if (authBox.get(HiveKeys.language) == null) {
      if (Get.deviceLocale!.languageCode.contains('ar') == true) {
        isEnglish = false;
      } else {
        isEnglish = true;
      }
    } else {
      isEnglish = authBox.get(HiveKeys.language);
    }
    update();
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await homeData.getData(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (products.isNotEmpty) {
          products.clear();
          homeProducts.clear();
          banners.clear();
          sortedProducts.clear();
          savedItems.clear();
          recentProduct.clear();
          newProducts.clear();
          categories.clear();
          newTrend.clear();
          brands.clear();
          userStyle.clear();
          colors.clear();
          productsSort[lastSortIndex].choosenSort = false;
          productsSort[0].choosenSort = true;
        }
        List itemsList = response['items'];
        List bannersList = response['banners']["data"];
        List brandsList = response['brands']["data"];
        List colorsList = response['Colors']["data"];
        List categoriesList = response['categories']["data"];
        if (response['recent'] != "failure") {
          List recentList = response['recent'];
          recentProduct.addAll(recentList.map((e) => Products.fromJson(e)));
        }
        products.addAll(itemsList.map((e) => Products.fromJson(e)));
        homeProducts.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.itemsMainPW != null));
        newTrend.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.isNewTrend == "1"));
        newProducts.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.itemsIsNew == "1"));
        allBanners.addAll(bannersList.map((e) => Banners.fromJson(e)));
        allBanners.length > 2
            ? banners.addAll([allBanners[0], allBanners[1]])
            : banners = allBanners;
        savedItems.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.favourite == "1"));
        sortedProducts = newTrend;
        brands.addAll(brandsList.map((e) => BrandsModel.fromJson(e)));
        colors.addAll(colorsList.map((e) => ColorsModel.fromJson(e)));
        categories.addAll(categoriesList.map((e) => Categories.fromJson(e)));
        savedItems.shuffle();
        handleRecentFavourite();
        if (savedItems.length > 2) {
          userStyle.add(savedItems[2]);
        }
        if (recentProduct.isNotEmpty) {
          int index = Random().nextInt(19);
          userStyle.add(products[index]);
        }
      } else {
        statusRequest = StatusRequest.offlinefailure;
      }
    }

    update();
  }

  @override
  sortProducts(int index) {
    if (lastSortIndex != index) {
      productsSort[index].choosenSort = true;
      productsSort[lastSortIndex].choosenSort = false;
      lastSortIndex = index;
      switch (index) {
        case 0:
          sortedProducts = newTrend;
          break;
        case 1:
          sortedProducts = newProducts;
          break;
        case 2:
          sortedProducts = products;
          sortedProducts.sort(
            (a, b) => double.parse(b.itemsPrice!)
                .compareTo(double.parse(a.itemsPrice!)),
          );
          break;
        case 3:
          sortedProducts = products;
          sortedProducts.sort(
            (a, b) => double.parse(a.itemsPrice!)
                .compareTo(double.parse(b.itemsPrice!)),
          );
          break;
        default:
      }
      update();
    }
    Get.back();
  }

  @override
  refreshPage() async {
    if (await checkinternet()) {
      await getData(false);
    } else {
      noInternetSnackBar();
    }
  }

  @override
  void handleRecentFavourite() {
    if (recentProduct.length == 1) {
      firstRecentIndex = getProductIndex(products, recentProduct, 0);
      recentProduct[0].favourite = products[firstRecentIndex].favourite;
    } else if (recentProduct.length == 2) {
      firstRecentIndex = getProductIndex(products, recentProduct, 0);
      secondeRecentIndex = getProductIndex(products, recentProduct, 1);
      recentProduct[0].favourite = products[firstRecentIndex].favourite;
      recentProduct[1].favourite = products[secondeRecentIndex].favourite;
    } else if (recentProduct.length > 2) {
      for (int i = 0; i < recentProduct.length; i++) {
        int index = getProductIndex(products, recentProduct, i);
        recentProduct[i].favourite = products[index].favourite;
      }
    }
  }

  @override
  void addToFavourite(int index) async {
    switch (index) {
      case 0:
        await handleFavourite(recentProduct[0]);
        break;
      case 1:
        await handleFavourite(recentProduct[1]);
        break;
      default:
    }
    update();
  }

  @override
  void recentToDetailes(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
          ArgumentsNames.productD: products[firstRecentIndex],
          ArgumentsNames.recentProducts: recentProduct
        });
        break;
      case 1:
        Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
          ArgumentsNames.productD: products[secondeRecentIndex],
          ArgumentsNames.recentProducts: recentProduct
        });
        break;
      default:
    }
  }

  @override
  onwillpop() {
    Get.back();
    refreshPage();
    return Future.value(false);
  }

  @override
  void addStyleToFavourite(int index) async {
    await handleFavourite(userStyle[index]);
    update();
  }

  @override
  void onReady() async {
    await getData(false);
    super.onReady();
  }
}
