import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';

class PageHeadersWithCartIcon extends StatelessWidget {
  const PageHeadersWithCartIcon({
    Key? key,
    required this.title,
    required this.backFunction,
    required this.cartFunction,
  }) : super(key: key);
  final String title;
  final void Function()? backFunction;
  final void Function()? cartFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: backFunction,
            icon: const Icon(Icons.arrow_back, color: AppColors.deepGrey)),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        IconButton(
            onPressed: cartFunction,
            icon: const Icon(Icons.shopping_cart, color: AppColors.deepGrey)),
      ],
    );
  }
}
