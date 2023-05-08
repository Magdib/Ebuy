import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/ArgumentsNames.dart';
import '../../../../core/theme/theme.dart';
import '../../../../data/model/HomePageModels/itemsModel.dart';
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
              ArgumentsNames.productListD: controller.products
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
                Positioned(
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
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: Text(
                    controller.homeProducts[index].itemsCatDetailes!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  child: Text(
                    controller.homeProducts[index].itemsMainPW!,
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
