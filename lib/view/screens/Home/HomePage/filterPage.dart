import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/data/dataSource/Static/static.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';

import '../../../../core/theme/theme.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterDialogContent.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterItemsContent.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterPageHeaders.dart';
import '../../../Widgets/Home/HomePage/NewTrend/FilterPageWidgets/GreyDivider.dart';
import '../../../Widgets/shared/CustomButton.dart';
import 'PricePage.dart';

class FilterPage extends GetView<HomePageControllerImp> {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FilterPageHeaders(title: 'Filter'),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(UINumber.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => FilterItemsContent(
                              title: controller.filterList[index].title,
                              type: 'All',
                              onPressed: () => Get.defaultDialog(
                                  title: controller.filterList[index].title,
                                  titleStyle: AppTheme
                                      .arabicTheme.textTheme.bodyText1!
                                      .copyWith(fontSize: 20),
                                  content: FilterDialogContent(
                                    filterIndex: index,
                                  )),
                            ),
                        separatorBuilder: (context, index) =>
                            const GreyDivider(),
                        itemCount: controller.filterList.length),
                    const GreyDivider(),
                    FilterItemsContent(
                        title: 'Price',
                        type: '8 - 385 \$',
                        onPressed: () => Get.dialog(PricePage())),
                    const GreyDivider()
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            CustomButton(text: 'View items', onPressed: () {}),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
