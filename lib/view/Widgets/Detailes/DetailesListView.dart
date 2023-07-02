import 'package:ebuy/core/constant/Server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class DetailesListView extends GetView<DetailesControllerImp> {
  const DetailesListView({
    Key? key,
    this.editable,
    required this.index,
  }) : super(key: key);
  final int index;
  final bool? editable;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: AppColors.primaryColor),
              child: controller.currentCommentsList[index].usersImage == null
                  ? Center(
                      child: Text(
                        controller.currentCommentsList[index].usersName![0],
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: 25),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          "${AppServer.usersImages}${controller.currentCommentsList[index].usersImage!}",
                      fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.currentCommentsList[index].usersName!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      unratedColor: AppColors.grey,
                      itemSize: 18,
                      initialRating: double.parse(
                          controller.currentCommentsList[index].commentRate!),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      glow: false,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    Text(
                      '  ${controller.currentCommentsList[index].commentRate}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            editable != null
                ? Row(
                    children: [
                      IconButton(
                          onPressed: () =>
                              controller.openReview(index, context),
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.primaryColor,
                          )),
                      IconButton(
                          onPressed: () => controller.deleteReview(index),
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.red,
                          )),
                    ],
                  )
                : const SizedBox()
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: UINumber.deviceWidth / 1.7,
          child: Text(
            controller.currentCommentsList[index].commentBody!,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(14)),
            ),
            Text(
              controller.currentCommentsList[index].commentDatetime!,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12),
            ),
            const SizedBox(
              width: 40,
            )
          ],
        ),
      ],
    );
  }
}
