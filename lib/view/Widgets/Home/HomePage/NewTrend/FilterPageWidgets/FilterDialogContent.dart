import 'package:ebuy/Controller/Home/FilterPageController.dart';
import 'package:ebuy/view/Widgets/shared/CustomRadio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterDialogContent extends GetView<FilterPageControllerimp> {
  const FilterDialogContent({
    Key? key,
    required this.filterIndex,
  }) : super(key: key);
  final int filterIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 40,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.filterList[filterIndex].type.length,
      itemBuilder: (context, index) => GetBuilder<FilterPageControllerimp>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            CustomRadio(
                onTap: () => controller.changeFilterValue(
                    controller.filterList[filterIndex].type[index],
                    filterIndex),
                condition: controller.filterValues[filterIndex] ==
                    controller.filterList[filterIndex].type[index],
                radius: 30),
            const SizedBox(
              width: 10,
            ),
            Text(
              controller.filterList[filterIndex].type[index],
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
