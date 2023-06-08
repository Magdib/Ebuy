import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/routes.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../data/model/HomePageModels/BannersModel.dart';

abstract class SearchController extends GetxController {
  void searchingProducts();
  void goToProduct(int index, BuildContext context);
  void changeSearchState(int index, BuildContext context);
  void goToSearchCategory(String category);
  void sortCategoriesProducts(String gender, String category);
  void searchFieldOnChanged(String value, BuildContext context);
}

class SearchControllerImp extends SearchController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController? searchController;
  late List<Products> products;
  List<Products> searchProducts = [];
  late List<Products> sortedProducts;
  List<Banners> banners = [];
  SearchState searchState = SearchState.none;
  late String categoryName;
  bool showTabBar = true;
  List<Tab> tabs = const [
    Tab(
      text: "Women",
    ),
    Tab(
      text: "Men",
    )
  ];
  List<Banners> womenBanners = [
    Banners(
      bannerImage: 'WomenNewIn.png',
      bannerTitle: 'NEW IN',
    ),
    Banners(
      bannerImage: 'WomenClothing.png',
      bannerTitle: 'CLOTHING',
    ),
    Banners(
      bannerImage: 'WomenShoes.png',
      bannerTitle: 'SHOES',
    ),
    Banners(
      bannerImage: 'WomenAccessories.png',
      bannerTitle: 'ACCESSORIES',
    )
  ];
  List<Banners> menBanners = [
    Banners(
      bannerImage: 'MenNewIn.png',
      bannerTitle: 'NEW IN',
    ),
    Banners(
      bannerImage: 'MenClothing.png',
      bannerTitle: 'CLOTHING',
    ),
    Banners(
      bannerImage: 'MenShoes.png',
      bannerTitle: 'SHOES',
    ),
    Banners(
      bannerImage: 'MenAccessories.png',
      bannerTitle: 'ACCESSORIES',
    )
  ];
  @override
  searchingProducts() {
    searchProducts = products
        .where((product) => product.itemsName!
            .isCaseInsensitiveContains(searchController!.text))
        .toList();
  }

  @override
  void goToProduct(int index, BuildContext context) {
    FocusScope.of(context).unfocus();
    Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
      ArgumentsNames.productListD: products,
      ArgumentsNames.productD: searchProducts[index]
    });
  }

  @override
  changeSearchState(int index, BuildContext context) {
    switch (index) {
      case 0:
        FocusScope.of(context).unfocus();
        searchController!.clear();
        searchState = SearchState.none;
        break;
      case 1:
        showTabBar = false;
        searchController!.clear();
        searchState = SearchState.noRecent;
        break;
      case 2:
        searchState = SearchState.searching;
        break;
      default:
    }
    update();
  }

  @override
  void goToSearchCategory(String category) {
    categoryName = category;
    String gender;
    tabController!.index == 0 ? gender = "female" : gender = "male";
    sortCategoriesProducts(gender, category);
    Get.toNamed(AppRoutes.searchCategoriesRoute);
  }

  @override
  void sortCategoriesProducts(String gender, String category) {
    switch (category) {
      case "NEW IN":
        sortedProducts = products
            .where((product) =>
                product.itemsIsNew!.contains("1") &&
                product.itemsGender!.startsWith(gender))
            .toList();

        break;
      case "CLOTHING":
        sortedProducts = products
            .where((product) =>
                (product.categoriesName!.contains("Dress") ||
                    product.categoriesName!.contains("Shorts") ||
                    product.categoriesName!.contains("T-Shirt")) &&
                product.itemsGender!.startsWith(gender))
            .toList();
        sortedProducts.shuffle();
        break;
      case "SHOES":
        sortedProducts = products
            .where((product) =>
                product.categoriesName!.contains("Shoes") &&
                product.itemsGender!.startsWith(gender))
            .toList();

        break;
      case "ACCESSORIES":
        sortedProducts = products
            .where((product) =>
                product.categoriesName!.contains("Accessories") &&
                product.itemsGender!.startsWith(gender))
            .toList();

        break;
      default:
    }
    if (sortedProducts.length > 3) {
      sortedProducts.removeRange(3, sortedProducts.length);
    }
  }

  @override
  void searchFieldOnChanged(String value, BuildContext context) {
    if (value.isNotEmpty) {
      searchingProducts();
      changeSearchState(2, context);
    } else {
      changeSearchState(1, context);
    }
  }

  @override
  void onInit() {
    HomePageControllerImp homeController = Get.find();
    products = homeController.products;
    banners.addAll([
      homeController.allBanners
          .where((banner) => banner.bannerImage!.contains("SearchBanner.png"))
          .first,
      homeController.allBanners
          .where((banner) => banner.bannerImage!.contains("FirstBanner.png"))
          .first
    ]);
    banners[1].bannerTitle = "NEW PRODUCTS";
    banners[1].bannerSubtitile = '';
    banners[1].bannerSubtitileAr = '';
    banners[1].bannerTitleAr = "منتجات جديدة";
    searchController = TextEditingController();
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    searchController!.dispose();
    tabController!.dispose();
    super.onClose();
  }
}
