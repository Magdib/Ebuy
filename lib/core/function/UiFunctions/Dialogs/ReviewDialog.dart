import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/view/Widgets/shared/DialogButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

reviewDialog(
  BuildContext context,
) {
  DetailesControllerImp controller = Get.find();
  Get.defaultDialog(
      onWillPop: () => controller.willPopReview(),
      title: "Review".tr,
      titleStyle: Theme.of(context).textTheme.bodyText1,
      content: GetBuilder<DetailesControllerImp>(
        builder: (controller) => HandlingDataRequest(
          onPressed: controller.editIndex == null
              ? () => controller.saveReview(false)
              : () => controller.saveReview(true),
          statusRequest: controller.commentStatusRequest,
          widget: Column(
            children: [
              Form(
                key: controller.formState,
                child: TextFormField(
                  maxLines: 4,
                  validator: (val) => controller.validateReview(val!),
                  controller: controller.reviewController,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                      hintText: "Write your review here...".tr,
                      hintStyle: Theme.of(context).textTheme.headline6,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "rate: ".tr,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBar.builder(
                    unratedColor: AppColors.grey,
                    itemSize: 25,
                    initialRating: controller.rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    glow: false,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.rate = rating;
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      confirm: DialogButton(
          title: 'Confirm'.tr,
          onPressed: controller.commentStatusRequest != StatusRequest.loading
              ? controller.editIndex == null
                  ? () => controller.saveReview(false)
                  : () => controller.saveReview(true)
              : () {}),
      cancel: DialogButton(
          title: "Cancel".tr, onPressed: () => controller.willPopReview()));
}
