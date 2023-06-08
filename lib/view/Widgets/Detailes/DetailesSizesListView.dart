import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';

class DetailesSizesListView extends StatelessWidget {
  const DetailesSizesListView({
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
          itemCount: controller.sizesLetter.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MaterialButton(
            onPressed: () => controller.changeSelectedSize(index),
            shape: RoundedRectangleBorder(
                side: controller.sizeSelected == index
                    ? const BorderSide(color: AppColors.red, width: 2)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(40)),
            height: 40,
            minWidth: 40,
            padding: const EdgeInsets.all(0),
            color: AppColors.white,
            child: Text(
              controller.sizesLetter[index],
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
