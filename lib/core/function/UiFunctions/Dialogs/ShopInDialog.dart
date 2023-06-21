import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view/Widgets/shared/CustomRadio.dart';

shopInDialog() {
  Get.defaultDialog(
      title: 'Choose country',
      titleStyle: Get.textTheme.bodyText1!.copyWith(fontSize: 20),
      content: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Row(
                children: [
                  CustomRadio(condition: false, radius: 30),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'United State',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 4));
}
