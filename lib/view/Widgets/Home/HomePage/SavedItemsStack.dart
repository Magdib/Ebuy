import 'package:ebuy/Controller/Home/HomePageController.dart';
import 'package:ebuy/core/class/enums.dart';
import 'package:ebuy/core/constant/Colors.dart';
import 'package:ebuy/core/constant/Server.dart';
import 'package:ebuy/core/localization/HandlePosition.dart';
import 'package:ebuy/core/localization/handleLanguageApi.dart';
import 'package:ebuy/data/model/HomePageModels/itemsModel.dart';
import 'package:ebuy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/ArgumentsNames.dart';
import '../../../../data/dataSource/Static/UINumbers.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SavedItemsStack extends GetView<HomePageControllerImp> {
  const SavedItemsStack({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);
  final List<Products> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 120,
            width: UINumber.deviceWidth,
            child: Card(
              elevation: 10,
              margin: handleEdgeInsets(30, 0, 46, 5),
              child: Padding(
                padding: handleEdgeInsets(
                  25,
                  0,
                  UINumber.deviceWidth / 1.7,
                  0,
                ),
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
                      onPressed: () =>
                          Get.toNamed(AppRoutes.detailsPageRoute, arguments: {
                            ArgumentsNames.productD: products[index],
                            ArgumentsNames.recentProducts:
                                controller.recentProduct
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
                tag: products[index].itemsImage!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppServer.itemsImages}${products[index].itemsImage!}",
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
                    handleProductsLanguage(
                        TranslationType.itemsName, products[index]),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${products[index].itemsPrice}',
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
