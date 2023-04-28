import 'package:ebuy/core/class/StatusRequest.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/core/services/intialServices.dart';
import 'package:ebuy/data/dataSource/Static/HiveKeys.dart';
import 'package:ebuy/data/dataSource/remote/home/homeData.dart';
import 'package:ebuy/data/model/HomePageModels/ProductsSortModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../core/function/SnackBars.dart';
import '../../core/function/checkInternet.dart';
import '../../data/model/HomePageModels/BannersModel.dart';
import '../../data/model/HomePageModels/itemsModel.dart';

abstract class HomePageController extends GetxController {
  void sortProducts(int index);
  void changePriceRange(SfRangeValues range);
  getData(bool showLoading);
  refreshPage();
}

class HomePageControllerImp extends HomePageController {
  late Box authBox;
  //SavedItems
  List<ProductsSort> productsSort = [
    ProductsSort(type: 'Recommended', choosenSort: true),
    ProductsSort(type: 'What\'s New', choosenSort: false),
    ProductsSort(type: 'Price: High to low', choosenSort: false),
    ProductsSort(type: 'Price: Low to high', choosenSort: false)
  ];
  HomeData homeData = HomeData(Get.find());
  List<Products> products = [];
  List<Products> homeProducts = [];
  List<Products> newTrend = [];
  List<Banners> banners = [];
  List<Products> savedItems = [];
  List<Products> newProducts = [];
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
        banners.addAll(bannersList.map((e) => Banners.fromJson(e)));
        savedItems.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.favourite == "1"));
        sortedProducts = newTrend;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  sortProducts(int index) async {
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
    await Future.delayed(const Duration(milliseconds: 500));

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
      homeProducts.clear();
      banners.clear();
      sortedProducts.clear();
      savedItems.clear();
      await getData(true);
    } else {
      noInternetSnackBar();
    }
  }

  @override
  void onReady() async {
    authBox = await Hive.openBox(HiveBoxes.authBox);

    getData(false);
    super.onReady();
  }
}
