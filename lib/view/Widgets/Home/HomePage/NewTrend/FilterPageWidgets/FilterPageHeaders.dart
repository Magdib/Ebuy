import 'package:ebuy/Controller/Home/FilterPageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPageHeaders extends GetView<FilterPageControllerimp> {
  const FilterPageHeaders({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => controller.onWillPop(),
            icon: const Icon(
              Icons.close,
              color: AppColors.grey,
            )),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
