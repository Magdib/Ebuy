import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';

class DetailesColorsListView extends StatelessWidget {
  const DetailesColorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: GetBuilder<DetailesControllerImp>(
        builder: (controller) => ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
          ),
          itemCount: controller.productColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () => controller.changeSelectedColor(index),
            shape: RoundedRectangleBorder(
                side: controller.colorSelected == index
                    ? const BorderSide(color: AppColors.white, width: 2)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(40)),
            height: 40,
            minWidth: 40,
            color: controller.productColors[index],
          ),
        ),
      ),
    );
  }
}
