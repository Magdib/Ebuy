import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/function/handleData.dart';
import 'package:ebuy/data/model/HomePageModels/BrandsModel.dart';
import 'package:ebuy/data/model/HomePageModels/CategoriesModel.dart';
import 'package:ebuy/data/model/HomePageModels/ColorsModel.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/routes.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../data/model/HomePageModels/FilterModel.dart';

abstract class FilterPageController extends GetxController {
  void getFilterList();
  void changePriceRange(SfRangeValues range);
  onWillPop();
  void filterProducts();
  void changeFilterValue(String value, int index);
}

class FilterPageControllerimp extends FilterPageController {
  SfRangeValues priceRang = const SfRangeValues(8.1, 385.1);
  late List<FilterModel> filterList;
  late List<Products> products;
  List<Products> filteredProducts = [];
  List<String> filterValues = ["All", "All", "All", "All", "All", "8 - 385"];

  @override
  void getFilterList() {
    products = Get.arguments[ArgumentsNames.productListF];
    List<BrandsModel> brands = Get.arguments[ArgumentsNames.brandsList];
    List<Categories> categories = Get.arguments[ArgumentsNames.categoriesList];
    List<ColorsModel> colors = Get.arguments[ArgumentsNames.colorsList];
    List<String> brandsEnglish = ["All"];
    List<String> brandsArabic = ["الكل"];
    for (int i = 0; i < 10; i++) {
      brandsEnglish.add(brands[i].brandName!);
      brandsArabic.add(brands[i].brandNameAr!);
    }

    List<String> categoriesArabic = ["الكل"];
    List<String> categoriesEnglish = ["All"];
    for (int i = 0; i < categories.length; i++) {
      categoriesEnglish.add(categories[i].categoriesName!);
      categoriesArabic.add(categories[i].categoriesNameAr!);
    }
    List<String> colorsEnglish = ["All"];
    List<String> colorsArabic = ["الكل"];
    for (int i = 0; i < colors.length; i++) {
      colorsEnglish.add(colors[i].colorsName!);
      colorsArabic.add(colors[i].colorNameAr!);
    }
    filterList = [
      FilterModel(title: 'Gender', type: ['All', 'male', 'female']),
      FilterModel(title: 'Product Category', type: categoriesEnglish),
      FilterModel(title: 'Color', type: colorsEnglish),
      FilterModel(title: 'Brand', type: brandsEnglish),
      FilterModel(
          title: 'Size', type: ['All', 'Medium', 'Large', 'X-Large', "Small"]),
    ];
  }

  @override
  void changeFilterValue(String value, int index) {
    filterValues[index] = value;
    for (int i = 0; i < filterValues.length; i++) {
      if (filterValues[i] == "") {
        filterValues[i] = "All";
      }
    }
    Get.back();
    update();
  }

  @override
  changePriceRange(SfRangeValues range) {
    priceRang = range;
    double rangeEnd = range.end;
    double rangeStart = range.start;
    filterValues[5] =
        "${rangeStart.toStringAsFixed(0)}-${rangeEnd.toStringAsFixed(0)}";
    update();
  }

  @override
  onWillPop() {
    for (int i = 0; i < filterValues.length; i++) {
      if (filterValues[i] == "") {
        filterValues[i] = "All";
      }
    }

    Get.back();
    update();
    return Future.value(false);
  }

  @override
  void filterProducts() {
    for (int i = 0; i < filterValues.length - 1; i++) {
      if (filterValues[i] == "All") {
        filterValues[i] = '';
      }
    }
    filteredProducts = products
        .where((product) =>
            product.itemsGender!.startsWith(filterValues[0]) &&
            product.categoriesName!.startsWith(filterValues[1]) &&
            product.itemsColor!.startsWith(filterValues[2]) &&
            product.itemsBrand!.startsWith(filterValues[3]) &&
            product.itemsSize!.startsWith(filterValues[4]) &&
            double.parse(product.itemsPrice!).isGreaterThan(priceRang.start) &&
            double.parse(product.itemsPrice!).isLowerThan(priceRang.end))
        .toList();
    Get.toNamed(AppRoutes.productsPageRoute, arguments: {
      ArgumentsNames.isProductsFilterd: true,
      ArgumentsNames.productListF: products,
      ArgumentsNames.filterdProducts: filteredProducts
    });
  }

  @override
  void onInit() {
    getFilterList();

    super.onInit();
  }
}
