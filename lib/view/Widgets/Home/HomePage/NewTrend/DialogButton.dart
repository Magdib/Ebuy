import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/view/Widgets/Home/HomePage/NewTrend/FilterPageWidgets/GreyDivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () => controller.sortProducts(index),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.productsSort[index].type,
                    style: AppTheme.arabicTheme.textTheme.bodyText1,
                  ),
                  Visibility(
                    visible: controller.productsSort[index].choosenSort,
                    child: const Icon(
                      Icons.check,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            const GreyDivider()
          ],
        ),
      ),
    );
  }
}