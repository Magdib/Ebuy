import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Colors.dart';
import '../../../../core/constant/Server.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import 'RecentlyViewedText.dart';

class RecentlyGridView extends GetView<HomePageControllerImp> {
  const RecentlyGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.recentProduct.isNotEmpty
        ? Column(
            children: [
              const RecentlyViewedText(),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 60),
                itemCount: controller.recentProduct.length,
                padding: const EdgeInsets.only(bottom: 80),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.recentToDetailes(index),
                    child: SizedBox(
                      height: 230,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: 40,
                              width: UINumber.deviceWidth / 2 - 10,
                              height: 190,
                              child: Card(
                                elevation: UINumber.cardElevation,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      GetBuilder<HomePageControllerImp>(
                                        builder: (controller) => IconButton(
                                            onPressed: () => controller
                                                .addToFavourite(index),
                                            icon: Icon(
                                              Icons.favorite,
                                              color: controller
                                                          .recentProduct[index]
                                                          .favourite! ==
                                                      "1"
                                                  ? AppColors.red
                                                  : AppColors.grey,
                                            )),
                                      ),
                                      Text(
                                        controller
                                            .recentProduct[index].itemsDesc!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Positioned(
                            right: 20,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppServer.itemsImages}${controller.recentProduct[index].itemsImage!}",
                              height: 118,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        : const SizedBox();
  }
}
