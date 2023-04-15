import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../Controller/Detailes/detailesController.dart';
import '../../../core/constant/Colors.dart';

import '../../../data/dataSource/Static/UINumbers.dart';
import 'DetailesListView.dart';
import 'SeeAllTextRow.dart';

class ReviewsCard extends GetView<DetailesControllerImp> {
  const ReviewsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: UINumber.cardElevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: SeeAllTextRow(title: 'Review', onTap: () {}),
          ),
          Divider(
            color: AppColors.grey,
            thickness: 0.7,
          ),
          ListView.separated(
            itemCount: controller.usersRate.length,
            padding: const EdgeInsets.only(top: 10, left: 15, bottom: 20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => DetailesListView(index: index),
            separatorBuilder: (context, index) => const SizedBox(
              height: 140,
            ),
          )
        ],
      ),
    );
  }
}
