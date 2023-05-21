import 'package:flutter/material.dart';

import '../../../core/constant/Colors.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    this.onTap,
    required this.condition,
    required this.radius,
  });
  final void Function()? onTap;
  final bool condition;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: condition == true ? AppColors.primaryColor : AppColors.grey),
      ),
    );
  }
}
