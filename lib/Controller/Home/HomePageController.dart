import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/function/handleFavourite.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/home/homeData.dart';
import 'package:ebuy/data/model/HomePageModels/CategoriesModel.dart';
import 'package:ebuy/data/model/HomePageModels/ColorsModel.dart';
import 'package:ebuy/data/model/HomePageModels/ProductsSortModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';
import '../../core/constant/ArgumentsNames.dart';
import '../../core/function/UiFunctions/SnackBars.dart';
import '../../core/function/checkInternet.dart';
import '../../core/function/getProductIndex.dart';
import '../../data/dataSource/remote/home/RecentData.dart';
import '../../data/model/HomePageModels/BannersModel.dart';
import '../../data/model/HomePageModels/BrandsModel.dart';
import '../../data/model/HomePageModels/FilterModel.dart';
import '../../data/model/HomePageModels/itemsModel.dart';
import '../../routes.dart';

abstract class HomePageController extends GetxController {
  void sortProducts(int index);
  getData(bool showLoading);
  refreshPage();
  void goToDetailes(int index);
  void handleRecents(int index);
  void handleRecentFavourite();
  void addToFavourite(int index);
  void recentToDetailes(int index);
  void addStyleToFavourite(int index);
}

class HomePageControllerImp extends HomePageController {
  late Box authBox;

  List<ProductsSort> productsSort = [
    ProductsSort(type: 'Recommended', choosenSort: true),
    ProductsSort(type: 'What\'s New', choosenSort: false),
    ProductsSort(type: 'Price: High to low', choosenSort: false),
    ProductsSort(type: 'Price: Low to high', choosenSort: false)
  ];
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
  late List<Products> sortedProducts;

  int lastSortIndex = 0;
  StatusRequest statusRequest = StatusRequest.loading;
  @override
  getData(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await homeData.getData(authBox.get(HiveKeys.userid));
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List itemsList = response['items'];
        List bannersList = response['banners'];
        List brandsList = response['brands'];
        List colorsList = response['Colors'];
        List categoriesList = response['categories'];
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
          userStyle.add(products[4]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  sortProducts(int index) {
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

    Get.back();
  }

  @override
  refreshPage() async {
    if (await checkinternet()) {
      products.clear();
      homeProducts.clear();
      banners.clear();
      sortedProducts.clear();
      savedItems.clear();
      recentProduct.clear();
      newTrend.clear();
      brands.clear();
      userStyle.clear();
      productsSort[lastSortIndex].choosenSort = false;
      productsSort[0].choosenSort = true;
      await getData(true);
      handleRecentFavourite();
    } else {
      noInternetSnackBar();
    }
  }

  @override
  void handleRecents(int index) async {
    if (recentProduct.isEmpty) {
      recentProduct.add(sortedProducts[index]);
    } else if (recentProduct.length == 1) {
      recentProduct.add(sortedProducts[index]);
    } else {
      await recentRemoveData.removeFromRecent(
          authBox.get(HiveKeys.userid), recentProduct[1].itemsId!);
      recentProduct.removeAt(1);
      recentProduct.insert(0, sortedProducts[index]);
    }

    var response = await recentAddData.addToRecent(
        authBox.get(HiveKeys.userid), sortedProducts[index].itemsId!);

    Get.back();
    if (response['status'] == 'success') {
      Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
        ArgumentsNames.productD: sortedProducts[index],
        ArgumentsNames.productListD: products
      });
    }
  }

  @override
  void goToDetailes(index) async {
    if (await checkinternet()) {
      if (recentProduct.length == 2) {
        if (recentProduct[0].itemsId == sortedProducts[index].itemsId ||
            recentProduct[1].itemsId == sortedProducts[index].itemsId) {
          Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
            ArgumentsNames.productD: sortedProducts[index],
            ArgumentsNames.productListD: products
          });
        } else {
          Get.dialog(
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
              barrierDismissible: false,
              arguments: {handleRecents(index)});
        }
      } else {
        Get.dialog(
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            barrierDismissible: false,
            arguments: {handleRecents(index)});
      }
      handleRecentFavourite();
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
          ArgumentsNames.productListD: products
        });
        break;
      case 1:
        Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
          ArgumentsNames.productD: products[secondeRecentIndex],
          ArgumentsNames.productListD: products
        });
        break;
      default:
    }
  }

  @override
  void addStyleToFavourite(int index) async {
    await handleFavourite(userStyle[index]);
    update();
  }

  @override
  void onReady() async {
    authBox = await Hive.openBox(HiveBoxes.authBox);
    await getData(false);
    super.onReady();
  }
}
