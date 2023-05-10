import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/data/dataSource/remote/home/homeData.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../core/function/handleData.dart';
import '../../data/dataSource/Static/HiveKeys.dart';

abstract class ProductsController extends GetxController {
  getData(bool showLoading);
}

class ProductsControllerimp extends ProductsController {
  Box authBox = Hive.box(HiveBoxes.authBox);
  List<Products> products = [];
  List<Products> allProducts = [];
  late String brandName;
  StatusRequest statusRequest = StatusRequest.loading;
  HomeData homeData = HomeData(Get.find());
  late bool isProductsFilter;
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
        allProducts.addAll(itemsList.map((e) => Products.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onReady() async {
    isProductsFilter = Get.arguments[ArgumentsNames.isProductsFilterd];
    if (isProductsFilter == false) {
      await getData(false);
      brandName = Get.arguments[ArgumentsNames.brandName];
      products = allProducts
          .where((product) => product.itemsBrand!.contains(brandName))
          .toList();
    } else {
      allProducts = Get.arguments[ArgumentsNames.productListF];
      products = Get.arguments[ArgumentsNames.filterdProducts];
      statusRequest = StatusRequest.none;
      update();
    }
    super.onReady();
  }
}
