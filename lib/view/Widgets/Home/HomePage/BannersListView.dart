import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/Home/HomePageController.dart';
import 'BannerCardWithRichtext.dart';

class BannersListView extends GetView<HomePageControllerImp> {
  const BannersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.banners.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) =>
          BannerCardWithRichText(banner: controller.banners[index]),
    );
  }
}
