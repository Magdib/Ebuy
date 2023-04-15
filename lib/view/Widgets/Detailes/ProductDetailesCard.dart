import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constant/Colors.dart';

import '../../../core/theme/theme.dart';
import '../../../data/dataSource/Static/UINumbers.dart';

class ProductDetailesCard extends StatelessWidget {
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
                'Women\'s hoodie ',
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
                        initialRating: 4.9,
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
                        '  4.9',
                        style: AppTheme.arabicTheme.textTheme.bodyText1,
                      )
                    ],
                  ),
                  Text(
                    '\$27.00',
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
