import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/view/screens/Home/HomePage/filterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/ArgumentsNames.dart';
import '../../../../routes.dart';
import '../../../Widgets/Home/HomePage/NewTrend/DialogButton.dart';
import '../../../Widgets/Home/HomePage/NewTrend/ItemsSetting.dart';
import '../../../Widgets/Home/HomePage/shared/PageHeadersWithCartIcon.dart';
import '../../../Widgets/Home/HomePage/NewTrend/NewTrendItemsGridView.dart';

class NewTrendPage extends GetView<HomePageControllerImp> {
  const NewTrendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () => controller.onwillpop(),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                PageHeadersWithCartIcon(
                    cartFunction: () => Get.toNamed(AppRoutes.cartRoute),
                    backFunction: () => Get.back(),
                    title: "New Trend".tr),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemsSetting(
                        title: 'Sort'.tr,
                        icon: Icons.filter_list,
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  content: SortDialogButton());
                            })),
                    ItemsSetting(
                      title: "Filter".tr,
                      icon: Icons.filter_alt_outlined,
                      onTap: () => Get.dialog(const FilterPage(), arguments: {
                        ArgumentsNames.productListF: controller.products,
                        ArgumentsNames.brandsList: controller.brands,
                        ArgumentsNames.categoriesList: controller.categories,
                        ArgumentsNames.colorsList: controller.colors
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const NewTrendItemsGridView(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
