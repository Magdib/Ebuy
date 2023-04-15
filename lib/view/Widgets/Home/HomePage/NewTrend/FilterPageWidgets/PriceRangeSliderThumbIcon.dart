import 'package:flutter/material.dart';

import '../../../../../../core/constant/Colors.dart';

class PriceRangeSliderThumbIcon extends StatelessWidget {
  const PriceRangeSliderThumbIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white),
    );
  }
}
