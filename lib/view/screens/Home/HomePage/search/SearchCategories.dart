import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/ArgumentsNames.dart';
import '../../../../../core/constant/Server.dart';
import '../../../../../data/model/HomePageModels/BannersModel.dart';
import '../../../../../routes.dart';
import '../../../../Widgets/Home/HomePage/BannerCardWithRichtext.dart';
import '../../../../Widgets/shared/ProductsPageGridView.dart';

class SearchCategories extends GetView<SearchControllerImp> {
  const SearchCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.categoryName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          centerTitle: true,
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            children: [
              ProductsPageGridView(
                  productsList: controller.sortedProducts,
                  allProducts: controller.products,
                  isScrollable: false),
              Text(
                "New edits",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: controller.banners.length,
                itemBuilder: (context, index) => BannerCardWithRichText(
                  banner: controller.banners[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              )
            ]));
  }
}
