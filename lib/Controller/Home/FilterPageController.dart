import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
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

  bool isEnglish = getLanguage();
  List<String> filterValues = [
    "All".tr,
    "All".tr,
    "All".tr,
    "All".tr,
    "All".tr,
    "8 - 385"
  ];

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
    isEnglish == false
        ? filterList = [
            FilterModel(
                title: 'Gender'.tr, type: ['All'.tr, 'male'.tr, 'female'.tr]),
            FilterModel(title: 'Product Category'.tr, type: categoriesArabic),
            FilterModel(title: 'Color'.tr, type: colorsArabic),
            FilterModel(title: 'Brand'.tr, type: brandsArabic),
            FilterModel(title: 'Size'.tr, type: [
              'All'.tr,
              "Small".tr,
              'Medium'.tr,
              'Large'.tr,
              'X-Large'.tr,
            ]),
          ]
        : filterList = [
            FilterModel(title: 'Gender'.tr, type: ['All', 'male', 'female']),
            FilterModel(title: 'Product Category'.tr, type: categoriesEnglish),
            FilterModel(title: 'Color'.tr, type: colorsEnglish),
            FilterModel(title: 'Brand'.tr, type: brandsEnglish),
            FilterModel(
                title: 'Size'.tr,
                type: ['All', "Small", 'Medium', 'Large', 'X-Large']),
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
    if (isEnglish) {
      for (int i = 0; i < filterValues.length; i++) {
        if (filterValues[i] == "") {
          filterValues[i] = "All";
        }
      }
    } else {
      for (int i = 0; i < filterValues.length; i++) {
        if (filterValues[i] == "") {
          filterValues[i] = "الكل";
        }
      }
    }

    Get.back();
    update();
    return Future.value(false);
  }

  @override
  void filterProducts() {
    if (isEnglish == true) {
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
              double.parse(product.itemsPrice!)
                  .isGreaterThan(priceRang.start) &&
              double.parse(product.itemsPrice!).isLowerThan(priceRang.end))
          .toList();
    } else {
      for (int i = 0; i < filterValues.length - 1; i++) {
        if (filterValues[i] == "الكل") {
          filterValues[i] = '';
        }
        switch (filterValues[4]) {
          case "صغير":
            filterValues[4] = "Small";
            break;
          case "متوسط":
            filterValues[4] = "Medium";
            break;
          case "كبير":
            filterValues[4] = "Large";
            break;
          case "كبير جداً":
            filterValues[4] = "X-Large";
            break;
          default:
            filterValues[4] = '';
        }
        filteredProducts = products
            .where((product) =>
                product.itemsGenderAr!.startsWith(filterValues[0]) &&
                product.categoriesNameAr!.startsWith(filterValues[1]) &&
                product.itemsColorAr!.startsWith(filterValues[2]) &&
                product.itemsBrandAr!.startsWith(filterValues[3]) &&
                product.itemsSize!.startsWith(filterValues[4]) &&
                double.parse(product.itemsPrice!)
                    .isGreaterThan(priceRang.start) &&
                double.parse(product.itemsPrice!).isLowerThan(priceRang.end))
            .toList();
      }
    }

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
