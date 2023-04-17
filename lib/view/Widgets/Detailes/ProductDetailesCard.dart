import 'package:ebuy/Controller/Detailes/detailesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class ProductDetailesCard extends GetView<DetailesControllerImp> {
  const ProductDetailesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
        height: 100,
        width: UINumber.deviceWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.product.itemsName}",
                style: AppTheme.arabicTheme.textTheme.bodyText1!
                    .copyWith(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        unratedColor: AppColors.grey,
                        itemSize: 25,
                        initialRating:
                            double.parse(controller.product.itemsRate!),
                        minRating: 1,
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
                        controller.product.itemsRate!,
                        style: AppTheme.arabicTheme.textTheme.bodyText1,
                      )
                    ],
                  ),
                  Text(
                    "${controller.product.itemsPrice!}\$",
                    style: AppTheme.arabicTheme.textTheme.bodyText1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
