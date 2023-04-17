import 'package:flutter/material.dart';

import '../../../../core/constant/Colors.dart';

class RecentlyViewedText extends StatelessWidget {
  const RecentlyViewedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recently viewed',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: AppColors.red, borderRadius: BorderRadius.circular(25)),
        )
      ],
    );
  }
}
