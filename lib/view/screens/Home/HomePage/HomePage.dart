import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/BannerCard.dart';
import '../../../Widgets/Home/HomePage/BannersListView.dart';
import '../../../Widgets/Home/HomePage/BrandsGridView.dart';
import '../../../Widgets/Home/HomePage/HomeSavedItems.dart';
import '../../../Widgets/Home/HomePage/ProductsGridView.dart';
import '../../../Widgets/Home/HomePage/RecentlyViewedText.dart';
import '../../../Widgets/Home/HomePage/UserStyleGridView.dart';
import '../../../Widgets/Home/HomePage/RecentlyGridView.dart';

class HomePage extends GetView<MainContrllerImp> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.getData(true),
        statusRequest: controller.statusRequest,
        widget: RefreshIndicator(
          onRefresh: () => controller.refreshPage(),
          color: AppColors.primaryColor,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(
                    AppRoutes.newTrendRoute,
                  ),
                  child: const NewTrendBanner(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ProductsGridView(),
                const BannersListView(),
                const SizedBox(
                  height: 30,
                ),
                const RecentlyGridView(),
                const HomeSavedItems(),
                Text(
                  'Brands you  may like',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BrandsGridView(),
                const UserStyleGridView(),
              ]),
        ),
      ),
    );
  }
}
