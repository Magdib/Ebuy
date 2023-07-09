import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';

import '../../../data/dataSource/Static/UINumbers.dart';
import 'DetailesListView.dart';

class ReviewsCard extends GetView<DetailesControllerImp> {
  const ReviewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: UINumber.cardElevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews'.tr,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.reviewsPageRoute),
                    child: Text(
                      "See All".tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 14),
                    ))
              ],
            ),
          ),
          const Divider(
            color: AppColors.grey,
            thickness: 0.7,
          ),
          GetBuilder<DetailesControllerImp>(
            builder: (controller) => controller.currentCommentsList.isNotEmpty
                ? ListView.separated(
                    itemCount: controller.currentCommentsList.length > 1
                        ? 2
                        : controller.currentCommentsList.length,
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, bottom: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        DetailesListView(index: index),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 100,
                    ),
                  )
                : Text(
                    "No reviews".tr,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
          )
        ],
      ),
    );
  }
}
