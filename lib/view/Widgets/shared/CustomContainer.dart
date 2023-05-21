import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.radius,
    this.margin,
    this.padding,
    this.borderColor,
  });
  final Widget child;
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height,
      margin: margin,
      padding: padding,
      width: width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.veryLightGrey, blurRadius: 10, spreadRadius: 0.1)
        ],
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 2)
            : null,
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
