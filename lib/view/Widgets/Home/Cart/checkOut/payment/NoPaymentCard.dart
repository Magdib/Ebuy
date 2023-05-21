import 'package:dotted_border/dotted_border.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';

class NoPaymentCard extends StatelessWidget {
  const NoPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      customPath: (size) => Path()
        ..moveTo(0, 0)
        ..lineTo(85, 0)
        ..lineTo(85, 85)
        ..lineTo(0, 85)
        ..lineTo(0, 0), // PathBuilder
      color: AppColors.veryLightGrey,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 22.5),
      dashPattern: const [10, 10],
      strokeWidth: 2,
      child: Container(
        height: 33,
        width: 40,
        decoration: BoxDecoration(
            color: AppColors.grey, borderRadius: BorderRadius.circular(7.5)),
      ),
    );
  }
}
