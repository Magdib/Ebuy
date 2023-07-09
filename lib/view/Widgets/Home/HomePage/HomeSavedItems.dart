import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/HomePageController.dart';
import '../../../../Controller/Home/MainPageController.dart';
import 'SavedItemsStack.dart';

class HomeSavedItems extends GetView<HomePageControllerImp> {
  const HomeSavedItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainContrllerImp mainContrllerImp = Get.find();
    return controller.savedItems.length > 1
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved items'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () => mainContrllerImp.changePage(3),
                    child: Text(
                      'View all'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) => SavedItemsStack(
                    products: controller.savedItems, index: index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        : const SizedBox();
  }
}
