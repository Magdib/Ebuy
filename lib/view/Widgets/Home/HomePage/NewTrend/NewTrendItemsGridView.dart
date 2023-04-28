import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/constant/Colors.dart';

import '../../../../../core/theme/theme.dart';

class NewTrendItemsGridView extends StatelessWidget {
  const NewTrendItemsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9),
          itemCount: controller.sortedProducts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.detailsPageRoute,
                  arguments: {"Product": controller.sortedProducts[index]}),
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
                      tag: controller.sortedProducts[index].itemsImage!,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppServer.itemsImages}${controller.sortedProducts[index].itemsImage!}",
                        height: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    left: 20,
                    child: Text(
                      controller.sortedProducts[index].itemsName!,
                      style: AppTheme.arabicTheme.textTheme.headline6!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Text(
                      '\$${controller.sortedProducts[index].itemsPrice}',
                      style: AppTheme.arabicTheme.textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
