import 'package:ebuy/core/constant/Colors.dart';

import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:ebuy/view/screens/Home/HomePage/filterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes.dart';
import '../../../Widgets/Home/HomePage/NewTrend/DialogButton.dart';
import '../../../Widgets/Home/HomePage/NewTrend/ItemsSetting.dart';
import '../../../Widgets/Home/HomePage/shared/PageHeadersWithCartIcon.dart';
import '../../../Widgets/Home/HomePage/NewTrend/NewTrendItemsGridView.dart';

class NewTrendPage extends StatelessWidget {
  const NewTrendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              PageHeadersWithCartIcon(
                  cartFunction: () => Get.toNamed(AppRoutes.cartRoute),
                  backFunction: () => Get.back(),
                  title: "New Trend"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemsSetting(
                      title: 'Sort',
                      icon: Icons.filter_list,
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                content: DialogButton());
                          })),
                  ItemsSetting(
                    title: "Filter",
                    icon: Icons.filter_alt_outlined,
                    onTap: () => Get.dialog(const FilterPage()),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const NewTrendItemsGridView(),
            ],
          ),
        )),
      ),
    );
  }
}
