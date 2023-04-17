import 'package:ebuy/Controller/Home/MainPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';

class SavedItemsTextRow extends GetView<MainContrllerImp> {
  const SavedItemsTextRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Saved items',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
        ),
        TextButton(
          onPressed: () => controller.changePage(3),
          child: Text(
            'View all',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }
}
