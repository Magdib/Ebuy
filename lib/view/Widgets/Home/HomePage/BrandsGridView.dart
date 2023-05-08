import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/ArgumentsNames.dart';
import '../../../../core/constant/Colors.dart';

import '../../../../data/dataSource/Static/UINumbers.dart';

class BrandsGridView extends GetView<HomePageControllerImp> {
  const BrandsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.brands.length * 21,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            mainAxisExtent: 45,
            crossAxisSpacing: 15),
        itemCount: controller.brands.length,
        itemBuilder: (context, index) => MaterialButton(
          elevation: 0,
          onPressed: () => Get.toNamed(AppRoutes.productsPageRoute, arguments: {
            ArgumentsNames.brandName: controller.brands[index].brandName!,
            ArgumentsNames.isProductsFilterd: false
          }),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UINumber.borderRadius)),
          color: AppColors.brandsGrey,
          child: Text(
            controller.brands[index].brandName!,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
