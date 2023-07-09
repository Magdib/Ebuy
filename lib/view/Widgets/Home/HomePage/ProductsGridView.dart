import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/localization/HandlePosition.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/ArgumentsNames.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductsGridView extends GetView<HomePageControllerImp> {
  const ProductsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9),
        itemCount: controller.homeProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
              ArgumentsNames.productD: controller.homeProducts[index],
              ArgumentsNames.recentProducts: controller.recentProduct
            }),
            child: Stack(
              children: [
                const SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.only(top: 40),
                    )),
                HandlePosition(
                  top: 0,
                  right: 10,
                  child: Hero(
                    tag: controller.homeProducts[index].itemsImage!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppServer.itemsImages}${controller.homeProducts[index].itemsImage!}",
                      height: 100,
                    ),
                  ),
                ),
                HandlePosition(
                  bottom: 40,
                  left: 20,
                  child: Text(
                    handlePorductsLanguage(TranslationType.catDetailes,
                        controller.homeProducts[index]),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                HandlePosition(
                  bottom: 15,
                  left: 20,
                  child: Text(
                    handlePorductsLanguage(
                        TranslationType.mainPW, controller.homeProducts[index]),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
