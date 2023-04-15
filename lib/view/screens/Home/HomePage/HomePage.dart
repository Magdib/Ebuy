import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Images.dart';

import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/BannerCard.dart';
import '../../../Widgets/Home/HomePage/BannerCardWithRichtext.dart';
import '../../../Widgets/Home/HomePage/BrandsGridView.dart';
import '../../../Widgets/Home/HomePage/ProductsGridView.dart';
import '../../../Widgets/Home/HomePage/SavedItemsStack.dart';
import '../../../Widgets/Home/HomePage/SavedItemsTextRow.dart';
import '../../../Widgets/Home/HomePage/UserStyleGridView.dart';

class HomePage extends GetView<MainContrllerImp> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => HandlingDataRequest(
        onPressed: () => controller.getData(),
        statusRequest: controller.statusRequest,
        widget: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.banners.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) =>
                    BannerCardWithRichText(banner: controller.banners[index]),
              ),
              const SizedBox(
                height: 20,
              ),
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
    );
  }
}
