import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/Controller/authControllers/SignUpController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../view/Widgets/Home/Search/SearchTextFiled.dart';
import '../constant/Colors.dart';
import '../constant/Images.dart';

class HandleSearchState extends GetView<SignUpControllerImp> {
  final SearchState searchState;
  final Widget widget;
  const HandleSearchState(
      {Key? key, required this.searchState, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return searchState == SearchState.noRecent
        ? Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Center(child: SvgPicture.asset(AppImagesAssets.noRecetSearch)),
              Center(
                child: Text(
                  'You have not recent searches.',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          )
        : searchState == SearchState.empty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(AppImagesAssets.lottieError, repeat: false),
                  ],
                ),
              )
            : searchState == SearchState.recent
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(AppImagesAssets.lottieError,
                            repeat: false),
                      ],
                    ),
                  )
                : searchState == SearchState.success
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(AppImagesAssets.lottieError,
                                repeat: false),
                          ],
                        ),
                      )
                    : widget;
  }
}

AppBar handleSearchAppBar(SearchState searchState, BuildContext context) {
  SearchControllerimp controller = Get.find();
  return searchState == SearchState.noRecent
      ? AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 80,
          titleSpacing: 10,
          elevation: 0,
          title: const SearchTextFiled(),
        )
      : searchState == SearchState.none
          ? AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              toolbarHeight: 80,
              titleSpacing: 10,
              elevation: 0,
              title: const SearchTextFiled(),
              bottom: TabBar(
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                tabs: controller.tabs,
                indicatorWeight: 4,
                unselectedLabelColor: AppColors.grey,
                controller: controller.tabController,
                labelColor: AppColors.primaryColor,
                indicatorColor: AppColors.primaryColor,
              ),
            )
          : AppBar();
}
