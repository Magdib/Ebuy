import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:ebuy/core/class/HandlingDataRequest.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/function/UiFunctions/Dialogs/ReviewDialog.dart';
import 'package:ebuy/core/function/UiFunctions/customAppBar.dart';
import 'package:ebuy/data/dataSource/Static/UINumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/Detailes/DetailesListView.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Reviews".tr, context, 4),
        body: ListView(padding: const EdgeInsets.all(10), children: [
          GetBuilder<DetailesControllerImp>(
            builder: (controller) => HandlingDataRequest(
              onPressed: () => controller.deleteReview(controller.editIndex!),
              statusRequest: controller.deleteCommentStatus,
              widget: Card(
                elevation: UINumber.cardElevation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews'.tr,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          IconButton(
                              onPressed: () => reviewDialog(context),
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.primaryColor,
                              ))
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.grey,
                      thickness: 0.7,
                    ),
                    controller.currentCommentsList.isNotEmpty
                        ? ListView.separated(
                            itemCount: controller.currentCommentsList.length,
                            padding: const EdgeInsets.only(
                                top: 10, left: 15, bottom: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => DetailesListView(
                                index: index,
                                editable: controller.currentCommentsList[index]
                                            .usersId! ==
                                        controller.userid
                                    ? true
                                    : null),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 60,
                            ),
                          )
                        : Text(
                            "No reviews",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
