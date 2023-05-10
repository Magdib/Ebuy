import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Images.dart';
import 'package:ebuy/data/model/HomePageModels/BannersModel.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/BannerCard.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/BannerCardWithRichtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/class/HandleSearchState.dart';
import '../../../core/class/enums.dart';
import '../../../core/constant/Server.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerimp());
    return Scaffold(
      appBar: handleSearchAppBar(SearchState.none, context),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: HandleSearchState(
              searchState: SearchState.none, widget: Container())),
    );
  }
}
