import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SavedItemsStack extends GetView<HomePageControllerImp> {
  const SavedItemsStack({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 120,
            width: UINumber.deviceWidth,
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.only(top: 30, left: 46, right: 5),
              child: Padding(
                padding:
                    EdgeInsets.only(left: UINumber.deviceWidth / 1.7, top: 25),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      )),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      splashRadius: 14,
                      onPressed: () => Get.toNamed(AppRoutes.detailsPageRoute,
                              arguments: {
                                "Product": product,
                                "ProductsList": controller.products
                              }),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
            )),
        SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: product.itemsImage!,
                child: CachedNetworkImage(
                  imageUrl: "${AppServer.itemsImages}${product.itemsImage!}",
                  height: 85,
                  width: 87,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    product.itemsName!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${product.itemsPrice}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
