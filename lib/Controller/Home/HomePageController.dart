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
  late Box userDataBox;
  //SavedItems
  List<ProductsSort> productsSort = [
    ProductsSort(type: 'Recommended', choosenSort: true),
    ProductsSort(type: 'What\'s New', choosenSort: false),
    ProductsSort(type: 'Price: High to low', choosenSort: false),
    ProductsSort(type: 'Price: Low to high', choosenSort: false)
  ];
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List<Products> products = [];
  List<Products> newTrend = [];
  List<Banners> banners = [];
  StatusRequest statusRequest = StatusRequest.loading;
  @override
  getData(bool showLoading) async {
    if (showLoading == true) {
      statusRequest = StatusRequest.loading;
      update();
    }
    var response = await homeData.getData("36");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(response);
        List itemsList = response['items'];
        List bannersList = response['banners'];
        products.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.itemsMainPW != null));
        newTrend.addAll(itemsList
            .map((e) => Products.fromJson(e))
            .where((product) => product.isNewTrend == "1"));
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
      banners.clear();
      await getData(false);
    } else {
      errorSnackBar(
          "No internet connection", "Please check your internet and try again");
    }
  }

  @override
  void onReady() async {
    getData(false);
    super.onReady();
  }
}
