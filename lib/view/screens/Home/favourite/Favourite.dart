import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/Controller/Home/favouritePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Widgets/Home/Favourite/SaveditemsListView.dart';

class FavouritePage extends GetView<MainContrllerImp> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteControllerImp favouriteControllerImp =
        Get.put(FavouriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Saved Items',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => controller.changePage(0),
            icon: const Icon(Icons.arrow_back, color: AppColors.deepGrey)),
        actions: [
          IconButton(
              onPressed: () => controller.changePage(2),
              icon: const Icon(Icons.shopping_cart, color: AppColors.deepGrey)),
        ],
        backgroundColor: AppColors.white,
        bottom: TabBar(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            indicatorWeight: 4,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.grey,
            controller: favouriteControllerImp.tabController,
            tabs: favouriteControllerImp.tabs,
            indicatorColor: AppColors.primaryColor,
            unselectedLabelStyle:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
            labelStyle:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16)),
      ),
      body: TabBarView(
          controller: favouriteControllerImp.tabController,
          children: [
            GetBuilder<FavouriteControllerImp>(
              builder: (controller) => SaveditemsListView(
                favouriteList: controller.favouriteItems,
              ),
            ),
            GetBuilder<FavouriteControllerImp>(
              builder: (controller) => SaveditemsListView(
                favouriteList: favouriteControllerImp.favouriteRecents,
              ),
            ),
          ]),
    );
  }
}
