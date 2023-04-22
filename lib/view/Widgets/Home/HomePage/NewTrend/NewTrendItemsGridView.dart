import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';

class NewTrendItemsGridView extends GetView<HomePageControllerImp> {
  const NewTrendItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9),
        itemCount: controller.newTrend.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Get.toNamed(AppRoutes.detailsPageRoute,
                arguments: {"Product": controller.newTrend[index]}),
            child: Stack(
              children: [
                const SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.only(top: 40),
                    )),
                Positioned(
                  top: 0,
                  right: 10,
                  child: Hero(
                    tag: controller.newTrend[index].itemsImage!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppServer.itemsImages}${controller.newTrend[index].itemsImage!}",
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 55,
                  left: 20,
                  child: Text(
                    controller.newTrend[index].itemsName!,
                    style: AppTheme.arabicTheme.textTheme.headline6!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    '\$${controller.newTrend[index].itemsPrice}',
                    style: AppTheme.arabicTheme.textTheme.bodyText1,
                  ),
                ),
                Positioned(
                    bottom: 18,
                    left: 110,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.red,
                        ))),
              ],
            ),
          );
        },
      ),
    );
  }
}
