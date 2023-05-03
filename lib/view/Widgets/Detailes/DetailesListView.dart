import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class DetailesListView extends GetView<DetailesControllerImp> {
  const DetailesListView({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: Image.asset(controller.usersRate[index].userImage),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.usersRate[index].username,
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
                      initialRating: controller.usersRate[index].rate,
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
                      '  ${controller.usersRate[index].rate}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: UINumber.deviceWidth / 4,
            ),
            GetBuilder<DetailesControllerImp>(
              builder: (controller) => IconButton(
                  splashRadius: 0.1,
                  padding: const EdgeInsets.only(bottom: 20),
                  onPressed: () => controller.likediLikeComment(index),
                  icon: controller.usersRate[index].isLiked == false
                      ? Icon(
                          Icons.favorite,
                          color: AppColors.grey,
                        )
                      : Icon(
                          Icons.favorite,
                          color: AppColors.red,
                        )),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: UINumber.deviceWidth / 1.7,
          child: Text(
            controller.usersRate[index].comment,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
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
              controller.usersRate[index].rateTime,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ],
    );
  }
}
