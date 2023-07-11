import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/ArgumentsNames.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/routes.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../data/model/HomePageModels/BannersModel.dart';

abstract class SearchController extends GetxController {
  void defineLists();
  void getSearchData();
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
  SearchState searchState = SearchState.loading;
  late String categoryName;
  bool showTabBar = true;
  late bool isEnglish;
  late List<Tab> tabs;
  late List<Banners> womenBanners;
  late List<Banners> menBanners;

  @override
  void defineLists() {
    tabs = [
      Tab(
        text: "Women".tr,
      ),
      Tab(
        text: "Men".tr,
      )
    ];
    menBanners = [
      Banners(
        bannerImage: 'MenNewIn.png',
        bannerTitle: 'NEW IN'.tr,
      ),
      Banners(
        bannerImage: 'MenClothing.png',
        bannerTitle: 'CLOTHING'.tr,
      ),
      Banners(
        bannerImage: 'MenShoes.png',
        bannerTitle: 'SHOES'.tr,
      ),
      Banners(
        bannerImage: 'MenAccessories.png',
        bannerTitle: 'ACCESSORIES'.tr,
      )
    ];
    womenBanners = [
      Banners(
        bannerImage: 'WomenNewIn.png',
        bannerTitle: 'NEW IN'.tr,
      ),
      Banners(
        bannerImage: 'WomenClothing.png',
        bannerTitle: 'CLOTHING'.tr,
      ),
      Banners(
        bannerImage: 'WomenShoes.png',
        bannerTitle: 'SHOES'.tr,
      ),
      Banners(
        bannerImage: 'WomenAccessories.png',
        bannerTitle: 'ACCESSORIES'.tr,
      )
    ];
  }

  @override
  void getSearchData() {
    isEnglish = getLanguage();
    defineLists();
    banners.clear();
    HomePageControllerImp homeController = Get.find();
    if (homeController.statusRequest == StatusRequest.offlinefailure) {
      searchState = SearchState.failure;
    }
    if (homeController.products.isNotEmpty) {
      products = homeController.products;
      banners.addAll([
        homeController.allBanners
            .where((banner) => banner.bannerImage!.contains("SearchBanner.png"))
            .first,
        homeController.allBanners
            .where((banner) => banner.bannerImage!.contains("FirstBanner.png"))
            .first
      ]);
      searchState = SearchState.none;
      banners[1].bannerTitle = "NEW PRODUCTS";
      banners[1].bannerSubtitile = '';
      banners[1].bannerSubtitileAr = '';
      banners[1].bannerTitleAr = "منتجات جديدة";
    }
    update();
  }

  @override
  searchingProducts() {
    searchProducts = products
        .where((product) =>
            product.itemsName!
                .isCaseInsensitiveContains(searchController!.text) ||
            product.itemsNameAr!.contains(searchController!.text))
        .toList();
  }

  @override
  void goToProduct(int index, BuildContext context) {
    HomePageControllerImp controller = Get.find();
    FocusScope.of(context).unfocus();
    Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
      ArgumentsNames.productD: searchProducts[index],
      ArgumentsNames.recentProducts: controller.recentProduct
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
    String gender;
    categoryName = category;
    tabController!.index == 0 ? gender = "female" : gender = "male";
    sortCategoriesProducts(gender, category);
    Get.toNamed(AppRoutes.searchCategoriesRoute);
  }

  @override
  void sortCategoriesProducts(String gender, String category) {
    if (isEnglish == true) {
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
    } else {
      switch (category) {
        case 'منتجات جديدة':
          sortedProducts = products
              .where((product) =>
                  product.itemsIsNew!.contains("1") &&
                  product.itemsGender!.startsWith(gender))
              .toList();

          break;
        case 'ألبسة':
          sortedProducts = products
              .where((product) =>
                  (product.categoriesName!.contains("Dress") ||
                      product.categoriesName!.contains("Shorts") ||
                      product.categoriesName!.contains("T-Shirt")) &&
                  product.itemsGender!.startsWith(gender))
              .toList();
          sortedProducts.shuffle();
          break;
        case 'أحذية':
          sortedProducts = products
              .where((product) =>
                  product.categoriesName!.contains("Shoes") &&
                  product.itemsGender!.startsWith(gender))
              .toList();

          break;
        case 'إكسسوارات':
          sortedProducts = products
              .where((product) =>
                  product.categoriesName!.contains("Accessories") &&
                  product.itemsGender!.startsWith(gender))
              .toList();

          break;
        default:
      }
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
    getSearchData();
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
