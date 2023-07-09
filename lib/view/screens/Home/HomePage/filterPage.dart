import 'package:ebuy/Controller/Home/FilterPageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterDialogContent.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/NewTrend/FilterPageWidgets/FilterItemsContent.dart';
import 'package:ebuy/view/Widgets/shared/CustomButton.dart';
import 'package:ebuy/view/Widgets/shared/GreyDivider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PricePage.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterPageControllerimp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Filter".tr,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          backgroundColor: AppColors.white,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => controller.onWillPop(),
              icon: const Icon(
                Icons.close,
                color: AppColors.black,
              )),
          elevation: 0.0,
        ),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                          itemBuilder: (context, index) =>
                              GetBuilder<FilterPageControllerimp>(
                                builder: (controller) => FilterItemsContent(
                                  title: controller.filterList[index].title,
                                  type: controller.filterValues[index],
                                  onPressed: () => Get.defaultDialog(
                                      title: controller.filterList[index].title,
                                      titleStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 20),
                                      content: FilterDialogContent(
                                        filterIndex: index,
                                      )),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const GreyDivider(),
                          itemCount: controller.filterList.length),
                      const GreyDivider(),
                      GetBuilder<FilterPageControllerimp>(
                        builder: (controller) => FilterItemsContent(
                            title: 'Price'.tr,
                            type: '${controller.filterValues[5]} \$',
                            onPressed: () => Get.dialog(const PricePage())),
                      ),
                      const GreyDivider()
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: 'View items'.tr,
                  onPressed: () => controller.filterProducts()),
            ],
          ),
        ));
  }
}
