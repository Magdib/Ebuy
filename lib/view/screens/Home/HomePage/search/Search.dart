import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/model/HomePageModels/BannersModel.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/BannerCardWithRichtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/class/HandleSearchState.dart';
import '../../../../../core/class/enums.dart';

import '../../../../Widgets/Home/Search/SearchBanner.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return GetBuilder<SearchControllerImp>(
      builder: (controller) => Scaffold(
        appBar: handleSearchAppBar(controller.searchState, context),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: HandleSearchState(
              searchState: controller.searchState,
              widget:
                  TabBarView(controller: controller.tabController, children: [
                SearchBannersList(
                  banners: controller.womenBanners,
                ),
                SearchBannersList(
                  banners: controller.menBanners,
                )
              ])),
        ),
      ),
    );
  }
}
