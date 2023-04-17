import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/BannerCard.dart';
import '../../../Widgets/Home/HomePage/BannersListView.dart';
import '../../../Widgets/Home/HomePage/BrandsGridView.dart';
import '../../../Widgets/Home/HomePage/ProductsGridView.dart';
import '../../../Widgets/Home/HomePage/RecentlyViewedText.dart';
import '../../../Widgets/Home/HomePage/SavedItemsStack.dart';
import '../../../Widgets/Home/HomePage/SavedItemsTextRow.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(
                    AppRoutes.newTrendRoute,
                  ),
                  child: const BannerCard(
                    title: 'NEW TREND',
                    image: AppImagesAssets.newtrind,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ProductsGridView(),
                const BannersListView(),
                const SizedBox(
                  height: 30,
                ),
                const RecentlyViewedText(),
                const SizedBox(
                  height: 20,
                ),
                const RecentlyGridView(),
                const SavedItemsTextRow(),
                const SavedItemsStack(
                  name: 'Handbag LV',
                  price: 225,
                  image: AppImagesAssets.saveditems1,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SavedItemsStack(
                    name: 'T-shirt',
                    price: 123,
                    image: AppImagesAssets.saveditems2),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Brands you  may like',
                  style: AppTheme.arabicTheme.textTheme.bodyText1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BrandsGridView(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Styles based on your shopping habits',
                  style: AppTheme.arabicTheme.textTheme.bodyText1!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                const UserStyleGridView(),
              ]),
        ),
      ),
    );
  }
}
