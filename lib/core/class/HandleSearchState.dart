import 'package:ebuy/Controller/Home/SearchController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/view/Widgets/shared/GreyDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../view/Widgets/Home/Search/SearchTextFiled.dart';
import '../constant/Colors.dart';
import '../constant/CustomIcons.dart';
import '../constant/Images.dart';

class HandleSearchState extends GetView<SearchControllerImp> {
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
                  'You have not recent searches.'.tr,
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
        : searchState == SearchState.searching
            ? ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () => controller.goToProduct(index, context),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        minLeadingWidth: 20,
                        title: Text(
                          handleProductsLanguage(TranslationType.itemsName,
                              controller.searchProducts[index]),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        leading: HandleSearchIcon(
                          productCat:
                              controller.searchProducts[index].categoriesName!,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const GreyDivider(),
                itemCount: controller.searchProducts.length)
            : searchState == SearchState.loading
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          AppImagesAssets.lottieLoading,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Loading...".tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                  )
                : searchState == SearchState.failure
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              AppImagesAssets.lottieoffline,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "No internet connection...".tr,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                      )
                    : widget;
  }
}

class HandleSearchIcon extends StatelessWidget {
  const HandleSearchIcon({super.key, required this.productCat});
  final String productCat;
  @override
  Widget build(BuildContext context) {
    return productCat == "Shoes"
        ? const Icon(CustomIcons.shoesIcon)
        : productCat == "Washables"
            ? const FaIcon(
                FontAwesomeIcons.bottleDroplet,
              )
            : productCat == "Accessories"
                ? const FaIcon(FontAwesomeIcons.hatCowboy)
                : const FaIcon(
                    FontAwesomeIcons.shirt,
                  );
  }
}

AppBar handleSearchAppBar(SearchState searchState, BuildContext context) {
  SearchControllerImp controller = Get.find();
  return searchState == SearchState.searching
      ? AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 80,
          titleSpacing: 10,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SearchTextFiled(
            readOnly: false,
            textController: controller.searchController!,
            onChanged: (value) =>
                controller.searchFieldOnChanged(value, context),
            suffixTap: () => controller.changeSearchState(1, context),
          ),
          leadingWidth: 40,
          leading: IconButton(
            onPressed: () => controller.changeSearchState(0, context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.grey,
            ),
            padding: const EdgeInsets.only(top: 10.0),
          ))
      : searchState == SearchState.loading || searchState == SearchState.failure
          ? customAppBar("Search".tr, context, 0)
          : AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              toolbarHeight: 80,
              titleSpacing: 10,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: SearchTextFiled(
                onTap: () => controller.changeSearchState(1, context),
                readOnly: controller.showTabBar,
                textController: controller.searchController!,
                onChanged: (value) =>
                    controller.searchFieldOnChanged(value, context),
                suffixTap: () => controller.changeSearchState(1, context),
              ),
              bottom: controller.showTabBar == true
                  ? TabBar(
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      tabs: controller.tabs,
                      indicatorWeight: 4,
                      unselectedLabelColor: AppColors.grey,
                      controller: controller.tabController,
                      labelColor: AppColors.primaryColor,
                      indicatorColor: AppColors.primaryColor,
                      labelStyle: Theme.of(context).textTheme.headline2,
                    )
                  : null,
            );
}
